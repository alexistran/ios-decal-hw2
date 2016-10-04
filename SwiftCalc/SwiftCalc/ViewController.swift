//
//  ViewController.swift
//  SwiftCalc
//
//  Created by Zach Zeleznick on 9/20/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Width and Height of Screen for Layout
    var w: CGFloat!
    var h: CGFloat!
    
    
    // IMPORTANT: Do NOT modify the name or class of resultLabel.
    //            We will be using the result label to run autograded tests.
    // MARK: The label to display our calculations
    var resultLabel = UILabel()
    
    // TODO: This looks like a good place to add some data structures.
    //       One data structure is initialized below for reference.
    var stringHolder: [String] = ["", ""]
    var currFirst: Bool = true
    var decFirst: Bool = false
    var decSecond: Bool = false
    var currOp: String = ""
    var result: String = ""
    //var recentPress: String = ""
    var rec: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        w = view.bounds.size.width
        h = view.bounds.size.height
        navigationItem.title = "Calculator"
        // IMPORTANT: Do NOT modify the accessibilityValue of resultLabel.
        //            We will be using the result label to run autograded tests.
        resultLabel.accessibilityValue = "resultLabel"
        makeButtons()
        // Do any additional setup here.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: A method to update your data structure(s) would be nice.
    //       Modify this one or create your own.
    func addCharToString(_ content: String, _ stringNum: Int) {
        if stringHolder[stringNum].characters.count < 7 {
            stringHolder[stringNum] += content
        }
    }
    func posOrNeg(_ stringNum: Int) {
        if stringHolder[stringNum] == "" {
            stringHolder[stringNum] += "-"
            updateResultLabel("-0")
        } else if stringHolder[stringNum] == "-" {
            stringHolder[stringNum] = ""
            updateResultLabel("0")
        } else if stringHolder[stringNum].characters.count == 7 {
            if stringHolder[stringNum][stringHolder[stringNum].startIndex] == "-" && stringHolder[stringNum].characters.count >= 1{
                stringHolder[stringNum] = String(stringHolder[stringNum].characters.dropFirst())
                updateResultLabel(stringHolder[stringNum])
            }
        } else {
            if stringHolder[stringNum][stringHolder[stringNum].startIndex] == "-" && stringHolder[stringNum].characters.count >= 1{
                stringHolder[stringNum] = String(stringHolder[stringNum].characters.dropFirst())
            } else {
                stringHolder[stringNum] = "-" + stringHolder[stringNum]
            }
            updateResultLabel(stringHolder[stringNum])
        }
    }
    func decimal(_ stringNum: Int) {
        if resultLabel.text == "0" || stringHolder[stringNum] == "" {
            stringHolder[stringNum] = "0."
        }
        else if resultLabel.text == "-0" {
            stringHolder[stringNum] = "-0."
        } else {
            if stringNum == 0 {
                if decFirst == false {
                    stringHolder[stringNum] += "."
                }
                if rec == "=" {
                    if currFirst == true {
                        stringHolder[0] = "0."
                    } else {
                        clearString(1)
                    }
                }
            } else if stringNum == 1 {
                if decSecond == false {
                    stringHolder[stringNum] += "."
                }
            }
        }
        updateResultLabel(stringHolder[stringNum])
    }
    
    func clearString(_ stringNum: Int) {
        stringHolder[stringNum] = ""
        if stringNum == 0 {
            decFirst = false
        } else if stringNum == 1 {
            decSecond = false
        }
    }
    func eq () {
        if currOp == "+" {
            if stringHolder[1].isEmpty {
                result = Helper.add(stringHolder[0], stringHolder[0], decFirst, decSecond)
                stringHolder[0] = result
            } else {
                result = Helper.add(stringHolder[0], stringHolder[1], decFirst, decSecond)
                stringHolder[0] = result
            }
        } else if currOp == "-" {
            if stringHolder[1].isEmpty {
                result = Helper.sub(stringHolder[0], stringHolder[0], decFirst, decSecond)
                stringHolder[0] = result
            } else {
                result = Helper.sub(stringHolder[0], stringHolder[1], decFirst, decSecond)
                stringHolder[0] = result
            }
            
        } else if currOp == "*" {
            if stringHolder[1].isEmpty {
                result = Helper.mult(stringHolder[0], stringHolder[0], decFirst, decSecond)
                stringHolder[0] = result
            } else {
                result = Helper.mult(stringHolder[0], stringHolder[1], decFirst, decSecond)
                stringHolder[0] = result
            }
        } else if currOp == "/" {
            if stringHolder[1].isEmpty {
                result = Helper.div(stringHolder[0], stringHolder[0])
                stringHolder[0] = result
            } else {
                result = Helper.div(stringHolder[0], stringHolder[1])
                stringHolder[0] = result
            }
            if floor(Double(result)!) != Double(result) {
                decFirst = true
            } else {
                decFirst = false
            }
        }
        

    }
    // TODO: Ensure that resultLabel gets updated.
    //       Modify this one or create your own.
    func updateResultLabel(_ content: String) {
        resultLabel.text = content
    }
    
    
    // TODO: A calculate method with no parameters, scary!
    //       Modify this one or create your own.
    func calculate() -> String {
        return "0"
    }
    
    // TODO: A simple calculate method for integers.
    //       Modify this one or create your own.
    func intCalculate(a: Int, b:Int, operation: String) -> Int {
        print("Calculation requested for \(a) \(operation) \(b)")
        return 0
    }
    
    // TODO: A general calculate method for doubles
    //       Modify this one or create your own.
    func calculate(a: String, b:String, operation: String) -> Double {
        print("Calculation requested for \(a) \(operation) \(b)")
        return 0.0
    }
    
    // REQUIRED: The responder to a number button being pressed.
    func numberPressed(_ sender: CustomButton) {
        guard Int(sender.content) != nil else { return }
        print("The number \(sender.content) was pressed")
        
//        if rec == "=" {
//            clearString(0)
//            clearString(1)
//            currFirst = true
//        }
        if rec == "=" {
            if currFirst == true {
                clearString(0)
            } else {
                clearString(1)
            }
        }
        rec = sender.content
        if currFirst == true {
            addCharToString(sender.content, 0)
            updateResultLabel(stringHolder[0])
        } else {
            addCharToString(sender.content, 1)
            updateResultLabel(stringHolder[1])
        }
        print("first" + stringHolder[0])
        print("second" + stringHolder[1])
        print("this is the result label: " + resultLabel.text!)
    }
    
    // REQUIRED: The responder to an operator button being pressed.
    func operatorPressed(_ sender: CustomButton) {
        //recentPress = sender.content
        print("\(sender.content) was pressed")
        if sender.content == "C" {
            rec = sender.content
            if currFirst == true {
                clearString(0)
            } else {
                clearString(1)
            }
            updateResultLabel("0")
        } else if sender.content == "+/-" {
            if currFirst == true {
                posOrNeg(0)
            } else {
                posOrNeg(1)
            }
        } else if sender.content == "+" || sender.content == "-" || sender.content == "*" || sender.content == "/" {
            if stringHolder[0] == "" || stringHolder[0] == "-" {
                stringHolder[0] += "0"
            }
            if stringHolder[1] != "" {
                eq()
                currFirst = true
                if stringHolder[0].characters.count > 7 && stringHolder[0].characters.count > 0{
                    resultLabel.text = Double(stringHolder[0])?.scientificStyle
                } else if currFirst == true{
                    resultLabel.text = stringHolder[0]
                    print("here")
                }
                clearString(1)
            }
            currFirst = false
            currOp = sender.content
        }
        else if sender.content == "=" {
            rec = "="
            eq()
            clearString(1)
            currFirst = true
            if stringHolder[0].characters.count > 7 && stringHolder[0].characters.count > 0{
                resultLabel.text = Double(stringHolder[0])?.scientificStyle
            } else {
                resultLabel.text = stringHolder[0]
            }
            print("first" + stringHolder[0])
            print("second" + stringHolder[1])
            print("this is the result label: " + resultLabel.text!)
            
        }
        else if sender.content == "%" {
            if currFirst == true {
                stringHolder[0] = Helper.div(stringHolder[0], "100")
                resultLabel.text = stringHolder[0]
                decFirst = true
            } else if currFirst == false {
                stringHolder[1] = Helper.div(stringHolder[1], "100")
                resultLabel.text = stringHolder[1]
                decSecond = true
            }
        }
    }
    
    // REQUIRED: The responder to a number or operator button being pressed.
    func buttonPressed(_ sender: CustomButton) {
        // Fill me in!
        print("\(sender.content) was pressed")
        //recentPress = sender.content
        if sender.content == "0" && resultLabel.text != "0"{
//            if recentPress == "=" {
//                clearString(0)
//                clearString(1)
//                currFirst = true
//            }
            if currFirst == true {
                addCharToString(sender.content, 0)
                updateResultLabel(stringHolder[0])
            } else {
                addCharToString(sender.content, 1)
                updateResultLabel(stringHolder[1])
            }
        } else if sender.content == "." {
            if currFirst == true {
                decimal(0)
                decFirst = true
                rec = sender.content
            } else {
                decimal(1)
                decSecond = true
            }
        }
    }
    
    // IMPORTANT: Do NOT change any of the code below.
    //            We will be using these buttons to run autograded tests.
    
    func makeButtons() {
        // MARK: Adds buttons
        let digits = (1..<10).map({
            return String($0)
        })
        let operators = ["/", "*", "-", "+", "="]
        let others = ["C", "+/-", "%"]
        let special = ["0", "."]
        
        let displayContainer = UIView()
        view.addUIElement(displayContainer, frame: CGRect(x: 0, y: 0, width: w, height: 160)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor.black
        }
        displayContainer.addUIElement(resultLabel, text: "0", frame: CGRect(x: 70, y: 70, width: w-70, height: 90)) {
            element in
            guard let label = element as? UILabel else { return }
            label.textColor = UIColor.white
            label.font = UIFont(name: label.font.fontName, size: 60)
            label.textAlignment = NSTextAlignment.right
        }
        
        let calcContainer = UIView()
        view.addUIElement(calcContainer, frame: CGRect(x: 0, y: 160, width: w, height: h-160)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor.black
        }
        
        let margin: CGFloat = 1.0
        let buttonWidth: CGFloat = w / 4.0
        let buttonHeight: CGFloat = 100.0
        
        // MARK: Top Row
        for (i, el) in others.enumerated() {
            let x = (CGFloat(i%3) + 1.0) * margin + (CGFloat(i%3) * buttonWidth)
            let y = (CGFloat(i/3) + 1.0) * margin + (CGFloat(i/3) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: el), text: el,
                                       frame: CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)) { element in
                                        guard let button = element as? UIButton else { return }
                                        button.addTarget(self, action: #selector(operatorPressed), for: .touchUpInside)
            }
        }
        // MARK: Second Row 3x3
        for (i, digit) in digits.enumerated() {
            let x = (CGFloat(i%3) + 1.0) * margin + (CGFloat(i%3) * buttonWidth)
            let y = (CGFloat(i/3) + 1.0) * margin + (CGFloat(i/3) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: digit), text: digit,
                                       frame: CGRect(x: x, y: y+101.0, width: buttonWidth, height: buttonHeight)) { element in
                                        guard let button = element as? UIButton else { return }
                                        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
            }
        }
        // MARK: Vertical Column of Operators
        for (i, el) in operators.enumerated() {
            let x = (CGFloat(3) + 1.0) * margin + (CGFloat(3) * buttonWidth)
            let y = (CGFloat(i) + 1.0) * margin + (CGFloat(i) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: el), text: el,
                                       frame: CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)) { element in
                                        guard let button = element as? UIButton else { return }
                                        button.backgroundColor = UIColor.orange
                                        button.setTitleColor(UIColor.white, for: .normal)
                                        button.addTarget(self, action: #selector(operatorPressed), for: .touchUpInside)
            }
        }
        // MARK: Last Row for big 0 and .
        for (i, el) in special.enumerated() {
            let myWidth = buttonWidth * (CGFloat((i+1)%2) + 1.0) + margin * (CGFloat((i+1)%2))
            let x = (CGFloat(2*i) + 1.0) * margin + buttonWidth * (CGFloat(i*2))
            calcContainer.addUIElement(CustomButton(content: el), text: el,
                                       frame: CGRect(x: x, y: 405, width: myWidth, height: buttonHeight)) { element in
                                        guard let button = element as? UIButton else { return }
                                        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            }
        }
    }
    
}
    
