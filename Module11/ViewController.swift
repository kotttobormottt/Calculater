//
//  ViewController.swift
//  Module11
//
//  Created by Andrey Zharov on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    var isNewValue = true
    var operation: MathOperation? = nil
    var previousOperation: MathOperation? = nil
    var result: Float = 0.00
    var newValue: Float = 0.00

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
    @IBAction func onNull(_ sender: Any) {
        addDigit("0")
    }
    @IBAction func onPoint(_ sender: Any) {
        addDigit(".")
    }
    
    @IBAction func onMinus(_ sender: Any) {
        operation = .substract
        previousOperation = nil
        isNewValue = true
        result = getFloat()
    }
    @IBAction func onPlus(_ sender: Any) {
        operation = .sum
        previousOperation = nil
        isNewValue = true
        result = getFloat()
    }
    @IBAction func onMultiply(_ sender: Any) {
        operation = .multiply
        previousOperation = nil
        isNewValue = true
        result = getFloat()
    }
    @IBAction func onDivide(_ sender: Any) {
        operation = .divide
        previousOperation = nil
        isNewValue = true
        result = getFloat()
    }
    @IBAction func onPercent(_ sender: Any) {
        operation = .percent
        previousOperation = nil
        isNewValue = true
        result = getFloat()
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
        
        resultLabel.text = ConstantStrings.CalculatorTitle
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
    
    func getFloat() -> Float {
        return Float(resultLabel.text ?? "0") ?? 0
    }
    
    func calculate() {
        guard let operation = operation else {
            return
        }
        
        if previousOperation != operation {
            newValue = getFloat()
        }

        result = operation.makeOperation(result: result, newValue: newValue)

        previousOperation = operation
        resultLabel.text = "\(result)"
        isNewValue = true
    }
}

enum MathOperation {
    case sum, substract, multiply, divide, percent
    
    func makeOperation(result: Float, newValue: Float) -> Float {
        switch self {
        case .sum:
            return (result + newValue)
        case .substract:
            return (result - newValue)
        case .multiply:
            return (result * newValue)
        case .divide:
            return (result / newValue)
        case .percent:
            return (result / 100 * newValue)
        }
    }
}

