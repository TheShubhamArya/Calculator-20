//
//  ViewController.swift
//  Calculator
//
//  Created by Shubham Arya on 5/8/20.
//  Copyright © 2020 Shubham Arya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// if numbers are greater than a particular number, then reduce the font size
    
    @IBOutlet weak var outputScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var num1 = ""
    var num2 = ""
    var num3 = ""
    var total = ""
    var Operater = " "
    var counterCE = 0
    var decimalFlagNum1 = false
    var decimalFlagNum2 = false
    
    func printOnCalculator( Num1: String=" ", Operator: String=" ", Num2: String=" "){
        total = num1+Operator+num2
        outputScreen.adjustsFontSizeToFitWidth = true // This adjusts the label as more numbers are typed into it
        outputScreen.text = Num1 + Operator + Num2
    }
    func numAssignment(Num1: String=" ",Operator: String=" ", Num2: String=" ") -> (num1:String,num2:String){
        var TempNum1 = ""
        var TempNum2 = ""
        if Operator == " "{
            TempNum1 = TempNum1 + Num1
            return(TempNum1,Num2)
        }
        else{
            TempNum2 = TempNum2 + Num2
            return(Num1,TempNum2)
        }
    }

    @IBAction func zero(_ sender: UIButton) {
        if Operater == " "{
            if num1 != ""{
                num1 = num1 + "0"
            }
        }
        else
        {
            if num2 != ""{
                num2 = num2 + "0"
            }
            if Operater == "^"{
                num2 = "0"
            }
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func one(_ sender: UIButton) {
        if Operater == " "{
            num1 = num1 + "1"
        }
        else
        {
            num2 = num2 + "1"
        }
        //(num1,num2) = numAssignment(Num1:"1",Operator:Operater,Num2:"1")
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func two(_ sender: UIButton) {
        if Operater == " "{
            num1 = num1 + "2"
        }
        else
        {
            num2 = num2 + "2"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    @IBAction func three(_ sender: UIButton) {
        if Operater == " "{
           num1 = num1 + "3"
        }
        else
        {
            num2 = num2 + "3"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func four(_ sender: UIButton) {
        if Operater == " "{
           num1 = num1 + "4"
        }
        else
        {
            num2 = num2 + "4"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func five(_ sender: UIButton) {
        if Operater == " "{
           num1 = num1 + "5"
        }
        else
        {
            num2 = num2 + "5"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func six(_ sender: UIButton) {
        if Operater == " "{
           num1 = num1 + "6"
        }
        else
        {
            num2 = num2 + "6"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func seven(_ sender: UIButton) {
        if Operater == " "{
           num1 = num1 + "7"
        }
        else
        {
            num2 = num2 + "7"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func eight(_ sender: UIButton) {
        if Operater == " "{
           num1 = num1 + "8"
        }
        else
        {
            num2 = num2 + "8"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    
    @IBAction func nine(_ sender: UIButton) {
        if Operater == " "{
           num1 = num1 + "9"
        }
        else
        {
            num2 = num2 + "9"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func decimal(_ sender: UIButton) {
        if Operater == " "{
            if num1 == ""{
                num1 = num1 + "0."
            }
            else{
                num1 = num1 + "."
            }
            decimalFlagNum1 = true
        }
        else
        {
            if num2 == ""{
                num2 = num2 + "0."
            }
            else{
                num2 = num2 + "."
            }
            decimalFlagNum2 = true
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    @IBAction func addition(_ sender: UIButton) {
        Operater = "+"
        if num1 == ""{
            num1 = "0"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func subtraction(_ sender: UIButton) {
        Operater = "-"
        if num1 == ""{
            num1 = "0"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func multiplication(_ sender: UIButton) {
        Operater = "x"
        if num1 == ""{
            num1 = "0"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)

    }
    
    @IBAction func division(_ sender: UIButton) {
        Operater = "÷"
        if num1 == ""{
            num1 = "0"
        }
        decimalFlagNum1 = true
        decimalFlagNum2 = true
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    
    @IBAction func power(_ sender: UIButton) {
        Operater = "^"
        if num1 == ""{
            num1 = "0"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func modulus(_ sender: UIButton) {
        Operater = "%"
        if num1 == ""{
            num1 = "0"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    @IBAction func allClear(_ sender: UIButton) {
        outputScreen.text = "0"
        num1 = ""
        num2 = ""
        Operater = " "
        decimalFlagNum1 = false
        decimalFlagNum2 = false
    }
    
    @IBAction func clearEntry(_ sender: UIButton) {
        
        if counterCE == 0{
            total.removeLast()
            total.removeLast()
            counterCE = counterCE + 1
        }
        else{
            total.removeLast()
        }
        outputScreen.text = total
    }
    @IBAction func changeSign(_ sender: UIButton) {
        let temp = Int(num1) ?? 0
        let decTemp = Float(num1) ?? 0.0
        let temp2 = Int(num2) ?? 0
        let decTemp2 = Float(num2) ?? 0.0
        print(num1)
        if Operater == " "{
            if temp<0 || decTemp<0 || num1 == "-"
            {
                //let posNum = num1.firstIndex(of: "-")!
                //num1 = String(num1[posNum])
                num1 = num1.replacingOccurrences(of: "-",with: "")
            }
            else
            {
                num1 = "-"+num1
            }
        }
        else{
            if temp2<0 || decTemp2<0 || num2 == "-"
            {
                
                num2 = num2.replacingOccurrences(of: "-",with: "")
            }
            else
            {
                num2 = "-"+num2
            }
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func isEqualTo(_ sender: UIButton) {
        let numberOne = Int(num1) ?? 0
        let numberTwo = Int(num2) ?? 0
        let numberThree = Float(num1) ?? 0.0
        let numberFour = Float(num2) ?? 0.0
        var num3 = 0
        var decNum = Float(0.0)
            
        if Operater == "+"{
            if decimalFlagNum1 || decimalFlagNum2{
                decNum = numberThree + numberFour            }
            else{
                num3 = numberOne + numberTwo
            }
        }
        else if Operater == "-"{
            if decimalFlagNum1 || decimalFlagNum2{
                decNum = Float(numberThree) - Float(numberFour)
            }
            else{
                num3 = numberOne - numberTwo
            }
        }
        else if Operater == "x"{
            if decimalFlagNum1 || decimalFlagNum2{
                decNum = Float(numberThree) * Float(numberFour)
            }
            else{
                num3 = numberOne * numberTwo
            }
        }

        else if Operater == "^"{
            if decimalFlagNum1 || decimalFlagNum2{
                decNum = pow(numberThree , numberFour)
            }
            else{
                num3 = 1
                if numberTwo == 0{
                    num3 = 1
                }
                else{
                    for _ in 0..<numberTwo{
                        num3 = num3*numberOne
                    }
                }
            }
        }
        else if Operater == "÷"{
            if decimalFlagNum1 || decimalFlagNum2{
                decNum = numberThree / numberFour
            }
            else{
                decNum = Float(numberOne)/Float(numberTwo)
            }
        }
        else if Operater == "%"{
            if decimalFlagNum1 || decimalFlagNum2{
                decNum = numberThree.remainder(dividingBy: numberFour)
                if decNum < 0{
                    decNum = decNum + numberFour
                }
            }
            else{
                if numberOne < numberTwo{
                    num3 = 0
                }
                else{
                    num3 = numberOne % numberTwo
                }
            }
        }
        else{
            if decimalFlagNum1 || decimalFlagNum2{
                decNum = numberThree
            }
            else{
                num3 = numberOne
            }
        }
        if (num1 == "80085" && num2=="") || num3 == 80085{
            outputScreen.text = "BOOBS"
        }
        else if decimalFlagNum2 || decimalFlagNum1 || Operater == "÷"{
            outputScreen.text = String(decNum)
            num1 = String(decNum)
        }
        else if Operater == " "{
            outputScreen.text = num1
        }
        else{
            outputScreen.text = String(num3)
            num1 = String(num3)
            if num1 == "0"{
                num1 = ""
            }
        }
        num2 = ""
        Operater = " "
    }
}

