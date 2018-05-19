This project is a demo on using CoreML framework for sentiment analysis of text. 
```.mlmodel``` was developed from Scikit-learn Pipeline using coremltools python package.

You can also use it in the form of plug and play. It is very simple and real quick.

**Steps:**

1) Drag and drop ```SentimentClassificationService.Swift``` and ```VKSentimentAnalysis.mlmodel``` into your project.

2) ```sentimentLabel.text = SentimentClassificationService.instance.prediction(from: "I love CoreML")?.emoji```.

We are done. 

If you would like to have a glimpse of the whole code and VKSentimentAnalysis.mlmodel description, you can download the project and run the sample project.

![ezgif com-optimize](https://user-images.githubusercontent.com/21070922/40268666-22b9e79e-5b8f-11e8-91f1-0f1e5d2cdb13.gif)


**Bonus:**

This project covers how to use 3D Touch to implement peek and pop using Custom Presentation Controllers. It also shows how to add a Today Extension to the project. 
