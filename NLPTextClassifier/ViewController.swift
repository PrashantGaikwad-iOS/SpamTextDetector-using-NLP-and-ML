//
//  ViewController.swift
//  NLPTextClassifier
//
//  Created by Prashant Gaikwad on 29/09/20.
//

import UIKit
import NaturalLanguage

class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - IBActions
    @IBAction func detectSpamAction(_ sender: Any) {
        guard let message = self.messageTextView?.text else {
            return
        }
        
        do {
            let spamDetector = try NLModel(mlModel: Spam_Classifier_Model().model)
            guard let prediction = spamDetector.predictedLabel(for: message) else {
                print("Failed to predict result")
                return
            }
            
            resultLabel?.text = "Result : \(prediction == "spam" ? "SPAM" : "NOT SPAM")"
            resultLabel?.textColor = prediction == "spam" ? .red : .green
            
        } catch {
            fatalError("Failed to load NLP Model: \(error)")
        }
    }
    
}

