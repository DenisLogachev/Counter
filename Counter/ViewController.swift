//
//  ViewController.swift
//  Counter
//
//  Created by Denis on 20/01/2025.
//

import UIKit

class ViewController: UIViewController {
    var counter:Int = 0
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getCurrentDate () -> String {
        let dateformatter = DateFormatter ()
        dateformatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateformatter.string(from: Date())
    }
    
    func scrollToBottom () {
        let range = NSMakeRange(textView.text.count - 1, 1)
        textView.scrollRangeToVisible (range)
    }
    private func updateLabelView () {
        labelView.text = "Значение счётчика: \(counter)"
    }
    
    private func addText (change: String) {
        let dateString = getCurrentDate ()
        textView.text += "\n[\(dateString)]: значение изменено на \(change)"
        scrollToBottom ()
    }
    
    private func addText (error: String) {
        let dateString = getCurrentDate ()
        textView.text += "\n[\(dateString)]: \(error)"
        scrollToBottom ()
    }
    
    
    @IBAction func tapPlusButton(_ sender: Any) {
        counter += 1
        updateLabelView ()
        addText(change: "+1")
    }
    @IBAction func tapResetButton(_ sender: Any) {
        counter = 0
        updateLabelView ()
        let dateString = getCurrentDate ()
        textView.text += "\n[\(dateString)]: значение сброшено"
    }
    
    @IBAction func tapMinusButton(_ sender: Any) {
        if counter > 0 {
        counter -= 1
        updateLabelView ()
        addText(change: "-1")
    }
        else {
            addText(error: "попытка уменьшить значение счётчика ниже 0")
        }
    }
}


