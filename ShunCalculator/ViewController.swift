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

    
    @IBOutlet weak var resultLabelOther: UILabel!
    var firstNumberTextOther = "8000"
    var secondNumberTextOther = ""
    
    var isFirstPlayer = true;
    
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
        var currentText = resultLabel.text!
        if (isFirstPlayer == false){
            currentText = resultLabelOther.text!
        }
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
                if (isFirstPlayer){
                    resultLabel.text = "\(currentText)"
                }
                else {
                    resultLabelOther.text = "\(currentText)"
                }
                break
            case "=":
                if (hasOp == true){
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = Int32(calculate())
                    if (isFirstPlayer){
                        resultLabel.text = "\(result)"
                        firstNumberText = "\(result)"
                        isFirstPlayer = false;
                        secondNumberText = ""
                    }
                    else {
                        resultLabelOther.text = "\(result)"
                        firstNumberTextOther = "\(result)"
                        isFirstPlayer = true;
                        secondNumberTextOther = ""
                    }
                }
                break
            case "del":
                if (isFirstNumber == false){
                    if (secondNumberText == ""){
                    }
                    else {
                        if (isFirstPlayer){
                            let lengthSecondNumberText = secondNumberText.characters.count;
                            secondNumberText = (String)(secondNumberText.prefix(lengthSecondNumberText - 1))
                            resultLabel.text = "\(secondNumberText)"
                        }
                        else {
                            let lengthSecondNumberText = secondNumberTextOther.characters.count;
                            secondNumberTextOther = (String)(secondNumberTextOther.prefix(lengthSecondNumberText - 1))
                            resultLabelOther.text = "\(secondNumberTextOther)"
                        }
                    }
                }
                break
            default:
                if (isFirstPlayer){
                    if isFirstNumber{
                        firstNumberText = "\(firstNumberText)"
                    }
                    else {
                        secondNumberText = "\(secondNumberText)\(text)"
                        resultLabel.text = "\(secondNumberText)"
                    }
                
                    break;
                }
                else {
                    if isFirstNumber{
                        firstNumberTextOther = "\(firstNumberTextOther)"
                    }
                    else {
                        secondNumberTextOther = "\(secondNumberTextOther)\(text)"
                        resultLabelOther.text = "\(secondNumberTextOther)"
                    }
                }
            }
        }
    }
    
    func calculate() -> Double {
        var firstNumber = 0.0
        var secondNumber = 0.0
        if (isFirstPlayer){
            firstNumber = Double(firstNumberText)!
            secondNumber = Double(secondNumberText)!
        }
            else {
            firstNumber = Double(firstNumberTextOther)!
            secondNumber = Double(secondNumberTextOther)!
            }
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

