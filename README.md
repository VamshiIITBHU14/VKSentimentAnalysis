This project is a demo on using CoreML framework for sentiment analysis of text. You can also use it in the form of plug and play. It is very simple and real quick.

**Steps:**

1) Drag and drop ```SentimentClassificationService.Swift``` and ```VKSentimentAnalysis.mlmodel``` into your project.

2) ```sentimentLabel.text = SentimentClassificationService.instance.prediction(from: "I love CoreML")?.emoji```.

We are done. 

If you would like to have a glimpse of the whole code and VKSentimentAnalysis.mlmodel description, you can download the project and run the sample project.
