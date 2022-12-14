//
//  ViewController.swift
//  Module11
//
//  Created by Andrey Zharov on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    var isNewValue = true
    var operation: String? = nil
    var previousOperation: String? = nil
    var result: Int = 0
    var newValue: Int = 0

    @IBAction func onOne(_ sender: Any) {
        addDigit("1")
    }
    @IBAction func onTwo(_ sender: Any) {
        addDigit("2")
    }
    @IBAction func onThree(_ sender: Any) {
        addDigit("3")
    }
    @IBAction func onFour(_ sender: Any) {
        addDigit("4")
    }
    @IBAction func onFive(_ sender: Any) {
        addDigit("5")
    }
    @IBAction func onSix(_ sender: Any) {
        addDigit("6")
    }
    @IBAction func onSeven(_ sender: Any) {
        addDigit("7")
    }
    @IBAction func onEight(_ sender: Any) {
        addDigit("8")
    }
    @IBAction func onNine(_ sender: Any) {
        addDigit("9")
    }
    
    @IBAction func onMinus(_ sender: Any) {
        operation = "-"
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @IBAction func onPlus(_ sender: Any) {
        operation = "+"
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }

    @IBAction func onEqual(_ sender: Any) {
        calculate()
    }
    
    @IBAction func onReset(_ sender: Any) {
        isNewValue = true
        result = 0
        newValue = 0
        operation = nil
        previousOperation = nil
        resultLabel.text = "0"
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func addDigit(_ digit: String) {
        if isNewValue {
            resultLabel.text = ""
            isNewValue = false
        }
        var digits = resultLabel.text
        digits?.append(digit)
        resultLabel.text = digits
    }
    
    func getInteger() -> Int {
        return Int(resultLabel.text ?? "0") ?? 0
    }
    
    func calculate() {
        guard let operation = operation else {
            return
        }
        
        if previousOperation != operation {
            newValue = getInteger()
        }
        
        if operation == "+" {
            result += newValue
        } else if operation == "-" {
            result -= newValue
        } else {
            return
        }
        previousOperation = operation
        resultLabel.text = "\(result)"
        isNewValue = true
    }
}

