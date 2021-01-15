//
//  Sentiment.swift
//  Sentiment
//
//  Created by Shailesh Patel on 15/01/2021.
//

import Foundation
import UIKit

extension String {
    func predictSentiment() -> Sentiment {
        return [Sentiment.positive, Sentiment.negative].randomElement()!
    }
}

enum Sentiment: String, CustomStringConvertible {
    case positive = "Positive"
    case negative = "Negative"
    
    var description: String { return self.rawValue }
    
    var icon: String {
        switch self {
            case .positive: return "😄"
            case .negative: return "😢"
        }
    }
    
    var color: UIColor {
        switch self {
            case .positive: return UIColor.systemGreen
            case .negative: return UIColor.systemRed
        }
    }
}
