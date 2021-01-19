import CreateML
import Foundation

// Configure as required
let inputFilepath = "/Users/shailesh/Downloads/"
let inputFilename = "epinions3"
let outputFilename = "SentimentClassificationModel"

let dataURL = URL(fileURLWithPath: inputFilepath + inputFilename + ".csv")
let data = try MLDataTable(contentsOf: dataURL)
let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

print("Begin Training...")

do {
    // Final training accuracy as percentages
    let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")
    let trainingAccuracy = (1.0 - sentimentClassifier.trainingMetrics.classificationError) * 100
    let validationAccuracy = (1.0 - sentimentClassifier.validationMetrics.classificationError) * 100
    
    print("Training evaluation: \(trainingAccuracy), " + "\(validationAccuracy)")
    
    // Testing accuracy as a percentage
    let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")
    
    let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100
    
    print("Testing evaluation: \(evaluationAccuracy)")
    
    let metadata = MLModelMetadata(author: "Shailesh Patel", shortDescription: "Sentiment Analysis Model", version: "1.0")
    
    try sentimentClassifier.write(to: URL(fileURLWithPath: inputFilepath + outputFilename + ".mlmodel"), metadata: metadata)
    
} catch {
    print("Error: \(error)")
}

