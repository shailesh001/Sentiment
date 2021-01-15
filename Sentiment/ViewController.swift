//
//  ViewController.swift
//  Sentiment
//
//  Created by Shailesh Patel on 15/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiView: UILabel!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    private let placeholderText = "Type Something here..."
    
    @IBAction func analyzeSentimentButtonPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        textView.text = placeholderText
        textView.textColor = UIColor.lightGray
        textView.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func performSentimentAnalysis() {
        let text = textView.text ?? ""
        let sentimentClass = text.predictSentiment()
        
        emojiView.text = sentimentClass.icon
        labelView.text = sentimentClass.description
        colorView.backgroundColor = sentimentClass.color
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = UIColor.lightGray
        }
    }
}

