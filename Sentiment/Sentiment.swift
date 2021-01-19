//
//  Sentiment.swift
//  Sentiment
//
//  Created by Shailesh Patel on 15/01/2021.
//

import Foundation
import UIKit
import NaturalLanguage


extension String {
    func predictSentiment(with nlModel: NLModel) -> Sentiment {
        //return [Sentiment.positive, Sentiment.negative].randomElement()!
        if self.isEmpty { return .neutral }
        let classString = nlModel.predictedLabel(for: self) ?? ""
        return Sentiment(rawValue: classString)
    }
}

enum Sentiment: String, CustomStringConvertible {
    case positive = "Positive"
    case negative = "Negative"
    case neutral = "None"
    
    var description: String { return self.rawValue }
    
    var icon: String {
        switch self {
        case .positive: return "😄"
        case .negative: return "😢"
        default: return "😑"
        }
    }
    
    var color: UIColor {
        switch self {
        case .positive: return UIColor.systemGreen
        case .negative: return UIColor.systemRed
        default: return UIColor.systemGray
        }
    }
    
  

    init(rawValue: String) {
        // Initialising rawValues must match class labels in training files
        switch rawValue {
        case "Pos": self = .positive
        case "Neg": self = .negative
        default: self = .neutral
        }
    }
}
