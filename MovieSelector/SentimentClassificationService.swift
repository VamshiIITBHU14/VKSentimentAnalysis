//
//  SentimentClassificationService.swift
//  MovieSelector
//
//  Created by Vamshi Krishna on 19/05/18.
//  Copyright © 2018 Vamshi Krishna. All rights reserved.
//

import Foundation
enum Sentiment {
    case Neutral
    case Positive
    case Negetive
    
    var emoji: String {
        switch self {
        case .Positive:
            return "😁"
        case .Neutral:
            return "🤨"
        case .Negetive:
            return "😡"
        }
    }
}

final class SentimentClassificationService {
    static let instance: SentimentClassificationService = SentimentClassificationService()
    
    private init(){}
    
    private let model = VKSentimentAnalysis()
    
    private let options: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .omitOther]
    
    private lazy var tagger: NSLinguisticTagger = {
        let l = NSLinguisticTagger.init(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"), options: Int(self.options.rawValue))
        return l
    }()
    
    private func featuresFrom(text: String) -> [String: Double] {
        var wordCount = [String: Double]()
        tagger.string = text
        let range = NSRange(text.startIndex..., in: text)
        tagger.enumerateTags(in: range, scheme: .nameType, options: options) { (tag, tokenRange, _, _) in
            let token = (text as NSString).substring(with: tokenRange).lowercased()
            guard token.count >= 3 else {
                return
            }
            if let value = wordCount[token] {
                wordCount[token] = value + 1.0
            } else {
                wordCount[token] = 1.0
            }
        }
        return wordCount
    }
    
    func prediction(from text: String) -> Sentiment? {
        do {
            let inputFeatures = featuresFrom(text: text)
            guard inputFeatures.count > 1 else {
                return nil
            }
            
            let output = try model.prediction(input: inputFeatures)
            
            switch output.classLabel {
            case "Pos":
                return Sentiment.Positive
            case "Neg":
                return Sentiment.Negetive
            default:
                return Sentiment.Neutral
            }
            
        } catch {
            return Sentiment.Neutral
        }
    }
}
