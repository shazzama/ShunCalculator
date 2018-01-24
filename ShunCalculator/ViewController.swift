//
//  ViewController.swift
//  ShunCalculator
//
//  Created by George Njoo on 2018-01-20.
//  Copyright © 2018 Njoko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var firstNumberText = "8000"
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleButtonPress(_ sender: UIButton) {
        if canClear {
           // resultLabel.text = ""
            canClear = false
        }
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text{
            case "+", "-", "*", "/":
                if hasOp{
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultLabel.text = "\(currentText)"
                break
            case "=":
                if (hasOp == true){
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = Int32(calculate())
                resultLabel.text = "\(result)"
                firstNumberText = "\(result)"
                }
                break
            case "del":
                if (isFirstNumber == false){
                    if (secondNumberText == ""){
                    }
                    else {
                    let lengthSecondNumberText = secondNumberText.characters.count;
                    secondNumberText = (String)(secondNumberText.prefix(lengthSecondNumberText - 1))
                    resultLabel.text = "\(secondNumberText)"
                    }
                }
                break
            default:
                if isFirstNumber{
                    firstNumberText = "\(firstNumberText)"
                }
                else {
                    secondNumberText = "\(secondNumberText)\(text)"
                    resultLabel.text = "\(secondNumberText)"
                }
                
                break;
            }
        }
    }
    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            if (secondNumber == 0){return  firstNumber}
            return firstNumber / secondNumber
        default:
            return 0
        }
        
        
        
    }
    
}

