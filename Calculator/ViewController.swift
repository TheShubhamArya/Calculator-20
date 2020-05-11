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
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var zeroBackground: UIButton!
    @IBOutlet weak var oneBackground: UIButton!
    @IBOutlet weak var twoBackground: UIButton!
    @IBOutlet weak var threeBackground: UIButton!
    @IBOutlet weak var fourBackground: UIButton!
    @IBOutlet weak var fiveBackground: UIButton!
    @IBOutlet weak var sixBackground: UIButton!
    @IBOutlet weak var sevenBackground: UIButton!
    @IBOutlet weak var eightBackground: UIButton!
    @IBOutlet weak var nineBackground: UIButton!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var ceBackground: UIButton!
    @IBOutlet weak var isEqualToBackground: UIButton!
    @IBOutlet weak var decimalBackground: UIButton!
    @IBOutlet weak var acBackground: UIButton!
    @IBOutlet weak var paranthesisSwitch: UIButton!
    
    
    @IBOutlet weak var rootChange: UIButton!
    @IBOutlet weak var piAnde: UIButton!
    @IBOutlet weak var reciprocalBackground: UIButton!
    @IBOutlet weak var percentageBackground: UIButton!
    @IBOutlet weak var signChangeBackground: UIButton!
    @IBOutlet weak var modulusBackground: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
         //  tap.numberOfTapsRequired = 2
         //  view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    /*
    @objc func doubleTapped(rc: Int = 0) {
        if rc%2 == 0{
            rootChange.setTitle("∛", for: .normal)
        }
        else
        {
            rootChange.setTitle("√", for: .normal)
        }
    }
    */
    var num1 = ""
    var num2 = ""
    var num3 = ""
    var piFlag = false
    var total = ""
    var Operater = " "
    var Operater2 = " "
    var resultDecimal = Float(0.0)
    var decimalFlagNum1 = false
    var decimalFlagNum2 = false
    var bracketFlag = false
    var pi_eCounter = 0
    var colorCounter = 0
    var bracketCounter = 0
    var rootCounter = 0
    func printOnCalculator( Num1: String=" ", Operator: String=" ", Num2: String=" "){
        total = num1+Operator+num2
        outputScreen.adjustsFontSizeToFitWidth = true // This adjusts the label as more numbers are typed into it
        outputScreen.text = Num1 + Operator + Num2
    }
   /* func numAssignment(Num1: String=" ",Operator: String=" ", Num2: String=" ") -> (num1:String,num2:String){
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
*/
    @IBAction func zero(_ sender: UIButton) {
        if Operater == " "{
            if num1 != "" && num1 != "\(Float.pi)"{
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
    
    @IBAction func pi(_ sender: UIButton) {
        if pi_eCounter%2 == 0{ // pi = 3.1415
            piAnde.setTitle("e", for: .normal)
            if Operater == " "{
            num1 = "\(Float.pi)"
            decimalFlagNum1 = true
            }
            else
            {
                num2 = "\(Float.pi)"
                decimalFlagNum2 = true
            }
             piFlag = true
        }
        else{  // e = 2.71828
            piAnde.setTitle("π", for: .normal)
            if Operater == " "{
                num1 = "2.7182818"
            decimalFlagNum1 = true
            }
            else
            {
                num2 = "2.7182818"
                decimalFlagNum2 = true
            }
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
        
        pi_eCounter += 1
    }
    
    @IBAction func decimal(_ sender: UIButton) {
        var decimalPresentNum2 = false
        var decimalPresentNum1 = false
        if Operater == " "{
            for point in num1{
                if point == "."{
                    decimalPresentNum1 = true
                }
            }
            if num1 == "" && !decimalPresentNum1{
                num1 = num1 + "0."
            }
            else{
                if !decimalPresentNum1{
                num1 = num1 + "."
                }
            }
            decimalFlagNum1 = true
        }
        else
        {
            for point in num2{
                if point == "."{
                    decimalPresentNum2 = true
                }
            }
            if num2 == "" && !decimalPresentNum2{
                num2 = num2 + "0."
            }
            else{
                if !decimalPresentNum2{
                    num2 = num2 + "."
                }
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
    
    
    @IBAction func root(_ sender: UIButton) {
        let numberOne = Float(num1) ?? 0
        let numberTwo = Float(num2) ?? 0
        if rootCounter%2 == 0{
            rootChange.setTitle("∛", for: .normal)
            //doubleTapped(rc: rootCounter)
            if Operater == " "{
                resultDecimal = pow(Float(numberOne),Float(0.5))
                num1 = String(resultDecimal)
                decimalFlagNum1 = true
            }
            else{
                resultDecimal = pow(Float(numberTwo),Float(0.5))
                num2 = String(resultDecimal)
                decimalFlagNum2 = true
            }
        }
        else{
            rootChange.setTitle("√", for: .normal)
           // doubleTapped(rc:rootCounter)
            if Operater == " "{
                resultDecimal = pow(Float(numberOne),Float(0.33333333))
                num1 = String(resultDecimal)
                decimalFlagNum1 = true
            }
            else{
                resultDecimal = pow(Float(numberTwo),Float(0.33333333))
                num2 = String(resultDecimal)
                decimalFlagNum2 = true
            }
        }
         printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
        
        rootCounter += 1
    }
    
    @IBAction func modulus(_ sender: UIButton) {
        Operater = "mod"
        if num1 == ""{
            num1 = "0"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
   /* @IBAction func factorial(_ sender: UIButton) {
        var numberOne = UInt64(num1) ?? 0
        var numberTwo = UInt64(num2) ?? 0
        if numberOne >= 0 && !decimalFlagNum1 && !decimalFlagNum2 && num2 == "" && Operater == " "{
            if numberOne == 0 {
                numberOne = 1
            }
            numberOne = Factorial(factorialNumber: numberOne)
            num1 = String(numberOne)
            printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
        }
        else if numberTwo >= 0  && !decimalFlagNum2 && !decimalFlagNum1{
            if numberTwo == 0 {
                numberTwo = 1
            }
            for i in 1..<numberTwo{
                numberTwo = numberTwo*i
            }
            num2 = String(numberTwo)
            printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
        }
        else{
            num1 = ""
            num2 = ""
            Operater = " "
            outputScreen.text = "Error"
        }
        decimalFlagNum1 = false
        decimalFlagNum2 = false
    }*/
    
    @IBAction func percentage(_ sender: UIButton) {
        let numberOne = Float(num1) ?? 0
        let numberTwo = Float(num2) ?? 0
        //let numberOneDecimal = Float(num1) ?? 0.0
        //let numberTwoDecimal = Float(num2) ?? 0.0
        if Operater == " "{
            resultDecimal = Float(numberOne)/Float(100)
            num1 = String(resultDecimal)
            decimalFlagNum1 = true
        }
        else{
             resultDecimal = Float(numberTwo)/Float(100)
             num2 = String(resultDecimal)
            decimalFlagNum2 = true
        }
         printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func reciprocal(_ sender: UIButton) {
        let numberOne = Float(num1) ?? 0
        let numberTwo = Float(num2) ?? 0
        if Operater == " "{
            resultDecimal = Float(1)/Float(numberOne)
            num1 = String(resultDecimal)
            decimalFlagNum1 = true
        }
        else{
             resultDecimal = Float(1)/Float(numberTwo)
             num2 = String(resultDecimal)
            decimalFlagNum2 = true
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
        //total.removeLast()
        if Operater == " "{
            if num1 != ""{
                num1.removeLast()
                for decimal in num1{
                    if decimal != "."{
                        decimalFlagNum1 = false
                    }
                }
            }
        }
        else if Operater != " " && num2 == ""{
            if Operater.removeLast() == "÷"{
                decimalFlagNum1 = false
                decimalFlagNum2 = false
            }
            Operater = " "
        }
        else{
            num2.removeLast()
            for decimal in num2{
                if decimal != "."{
                    decimalFlagNum2 = false
                }
            }
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
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
        
    @IBAction func openCloseBracket(_ sender: UIButton) {
        if bracketCounter%2 == 0{ //BRACKET IS OPEN
            paranthesisSwitch.setTitle(")", for: .normal)
            bracketFlag = true
        }
        else{ //BRACKET IS CLOSED
            paranthesisSwitch.setTitle("(", for: .normal)
            bracketFlag = false
        }
        bracketCounter += 1
    }
    
    @IBAction func isEqualTo(_ sender: UIButton) {
        let numberOne = Int64(num1) ?? 0
        let numberTwo = Int64(num2) ?? 0
        var numberOneDecimal = Float(num1) ?? 0.0
        var numberTwoDecimal = Float(num2) ?? 0.0
        if piFlag{
            if num1 == "\(Float.pi)"{
                numberOneDecimal = Float.pi
            }
            if num2 == "\(Float.pi)"{
                numberTwoDecimal = Float.pi
            }
            piFlag = false
        }
        var result = Int64(0)
        if Operater == "+"{
            if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = numberOneDecimal + numberTwoDecimal
            }
            else{
                result = numberOne + numberTwo
            }
        }
        else if Operater == "-"{
            if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = Float(numberOneDecimal) - Float(numberTwoDecimal)
            }
            else{
                result = numberOne - numberTwo
            }
        }
        else if Operater == "x"{
            if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = Float(numberOneDecimal) * Float(numberTwoDecimal)
            }
            else{
                result = numberOne * numberTwo
               
            }
        }

        else if Operater == "^"{
            if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = pow(numberOneDecimal , numberTwoDecimal)
            }
            else{
                result = 1
                if numberTwo == 0{
                    result = 1
                }
                else{
                    for _ in 0..<numberTwo{
                        result = result*numberOne
                    }
                }
            }
        }
        else if Operater == "÷"{
            if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = numberOneDecimal / numberTwoDecimal
            }
            else{
                resultDecimal = Float(numberOne)/Float(numberTwo)
            }
        }
        else if Operater == "mod"{
            if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = numberOneDecimal.remainder(dividingBy: numberTwoDecimal)
                if resultDecimal < 0{
                    resultDecimal = resultDecimal + numberTwoDecimal
                }
            }
            else{
                if numberOne < numberTwo{
                    result = 0
                }
                else{
                    result = numberOne % numberTwo
                }
            }
        }
        else{
            if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = numberOneDecimal
            }
            else{
                result = numberOne
            }
        }
        if (num1 == "80085" && num2=="") || result == 80085{
            outputScreen.text = "BOOBS"
        }
        else if decimalFlagNum2 || decimalFlagNum1 || Operater == "÷"{
            outputScreen.text = String(resultDecimal)
            num1 = String(resultDecimal)
        }
        else if Operater == " "{
            outputScreen.text = num1
        }
        else{
            outputScreen.text = String(result)
            num1 = String(result)
            if num1 == "0"{
                num1 = ""
            }
        }
        num2 = ""
        Operater = " "
    }
    @IBAction func colorChange(_ sender: UIButton) {
        
           if colorCounter%3 == 0{
            // Dark MODE
               outputScreen.backgroundColor = .white
               outputScreen.textColor = .black
               backgroundView.backgroundColor = .white
               zeroBackground.backgroundColor = .black
               zeroBackground.setTitleColor(.white,for: .normal)
               oneBackground.backgroundColor = .black
               oneBackground.setTitleColor(.white,for: .normal)
               twoBackground.backgroundColor = .black
               twoBackground.setTitleColor(.white,for: .normal)
               threeBackground.backgroundColor = .black
               threeBackground.setTitleColor(.white,for: .normal)
               fourBackground.backgroundColor = .black
               fourBackground.setTitleColor(.white,for: .normal)
               fiveBackground.backgroundColor = .black
               fiveBackground.setTitleColor(.white,for: .normal)
               sixBackground.backgroundColor = .black
               sixBackground.setTitleColor(.white,for: .normal)
               sevenBackground.backgroundColor = .black
               sevenBackground.setTitleColor(.white,for: .normal)
               eightBackground.backgroundColor = .black
               eightBackground.setTitleColor(.white,for: .normal)
               nineBackground.backgroundColor = .black
               nineBackground.setTitleColor(.white,for: .normal)
               colorButton.setTitle("Night", for: .normal)
               colorButton.setTitleColor(.black,for: .normal)
            
           }
           else if colorCounter%3 == 2{
            // Light MODE
               outputScreen.backgroundColor = UIColor(red: 0.1, green: 0.1, blue:
               0.1, alpha: 1)
               outputScreen.textColor = UIColor.white
               backgroundView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
               zeroBackground.backgroundColor = .secondarySystemBackground
               zeroBackground.setTitleColor(.black,for: .normal)
               oneBackground.backgroundColor = .secondarySystemBackground
               oneBackground.setTitleColor(.black,for: .normal)
               twoBackground.backgroundColor = .secondarySystemBackground
               twoBackground.setTitleColor(.black,for: .normal)
               threeBackground.backgroundColor = .secondarySystemBackground
               threeBackground.setTitleColor(.black,for: .normal)
               fourBackground.backgroundColor = .secondarySystemBackground
               fourBackground.setTitleColor(.black,for: .normal)
               fiveBackground.backgroundColor = .secondarySystemBackground
               fiveBackground.setTitleColor(.black,for: .normal)
               sixBackground.backgroundColor = .secondarySystemBackground
               sixBackground.setTitleColor(.black,for: .normal)
               sevenBackground.backgroundColor = .secondarySystemBackground
               sevenBackground.setTitleColor(.black,for: .normal)
               eightBackground.backgroundColor = .secondarySystemBackground
               eightBackground.setTitleColor(.black,for: .normal)
               nineBackground.backgroundColor = .secondarySystemBackground
               nineBackground.setTitleColor(.black,for: .normal)
            colorButton.setTitle("Dark", for: .normal)
            colorButton.setTitleColor(.black,for: .normal)
            colorButton.backgroundColor = .systemOrange
            ceBackground.setTitleColor(.black,for: .normal)
            ceBackground.backgroundColor = .systemOrange
            acBackground.setTitleColor(.black,for: .normal)
            acBackground.backgroundColor = .systemOrange
            paranthesisSwitch.setTitleColor(.black,for: .normal)
            paranthesisSwitch.backgroundColor = .systemOrange
            isEqualToBackground.setTitleColor(.white,for: .normal)
            isEqualToBackground.backgroundColor = .systemOrange
            decimalBackground.setTitleColor(.white,for: .normal)
            decimalBackground.backgroundColor = .systemOrange
            piAnde.setTitleColor(.black,for: .normal)
            piAnde.backgroundColor = UIColor(red: 0.27, green: 0.616, blue:0.8, alpha: 1)
            rootChange.setTitleColor(.black,for: .normal)
            rootChange.backgroundColor = UIColor(red: 0.27, green: 0.616, blue:0.8, alpha: 1)
            reciprocalBackground.setTitleColor(.black,for: .normal)
            reciprocalBackground.backgroundColor = UIColor(red: 0.27, green: 0.616, blue:0.8, alpha: 1)
            percentageBackground.setTitleColor(.black,for: .normal)
            percentageBackground.backgroundColor = UIColor(red: 0.27, green: 0.616, blue:0.8, alpha: 1)
            signChangeBackground.setTitleColor(.black,for: .normal)
            signChangeBackground.backgroundColor = UIColor(red: 0.27, green: 0.616, blue:0.8, alpha: 1)
            modulusBackground.setTitleColor(.black,for: .normal)
            modulusBackground.backgroundColor = UIColor(red: 0.27, green: 0.616, blue:
            0.8, alpha: 1)
            colorButton.setTitleColor(.black,for: .normal)
           }
           else{
            // NIGHT MODE
            outputScreen.backgroundColor = UIColor(red: 0.075, green: 0.075, blue: 0.075, alpha: 1)
            backgroundView.backgroundColor = UIColor(red: 0.075, green: 0.075, blue: 0.075, alpha: 1)
            outputScreen.textColor = .white
            //backgroundView.backgroundColor = .white
            zeroBackground.backgroundColor = .black
            zeroBackground.setTitleColor(.white,for: .normal)
            oneBackground.backgroundColor = .black
            oneBackground.setTitleColor(.white,for: .normal)
            twoBackground.backgroundColor = .black
            twoBackground.setTitleColor(.white,for: .normal)
            threeBackground.backgroundColor = .black
            threeBackground.setTitleColor(.white,for: .normal)
            fourBackground.backgroundColor = .black
            fourBackground.setTitleColor(.white,for: .normal)
            fiveBackground.backgroundColor = .black
            fiveBackground.setTitleColor(.white,for: .normal)
            sixBackground.backgroundColor = .black
            sixBackground.setTitleColor(.white,for: .normal)
            sevenBackground.backgroundColor = .black
            sevenBackground.setTitleColor(.white,for: .normal)
            eightBackground.backgroundColor = .black
            eightBackground.setTitleColor(.white,for: .normal)
            nineBackground.backgroundColor = .black
            nineBackground.setTitleColor(.white,for: .normal)
            colorButton.setTitle("Light", for: .normal)
            colorButton.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
            ceBackground.setTitleColor(.white,for: .normal)
            ceBackground.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
            acBackground.setTitleColor(.white,for: .normal)
            acBackground.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
            paranthesisSwitch.setTitleColor(.white,for: .normal)
            paranthesisSwitch.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
            isEqualToBackground.setTitleColor(.white,for: .normal)
            //isEqualToBackground.backgroundColor = UIColor(red: 0.1, green: 0.1, blue:0.1, alpha: 1)
            decimalBackground.setTitleColor(.white,for: .normal)
            decimalBackground.backgroundColor = UIColor(red: 0.1, green: 0.1, blue:
            0.1, alpha: 1)
            piAnde.setTitleColor(.white,for: .normal)
            piAnde.backgroundColor = UIColor(red: 0.3, green: 0.3, blue:
            0.3, alpha: 1)
            rootChange.setTitleColor(.white,for: .normal)
            rootChange.backgroundColor = UIColor(red: 0.3, green: 0.3, blue:
            0.3, alpha: 1)
            reciprocalBackground.setTitleColor(.white,for: .normal)
            reciprocalBackground.backgroundColor = UIColor(red: 0.3, green: 0.3, blue:
            0.3, alpha: 1)
            percentageBackground.setTitleColor(.white,for: .normal)
            percentageBackground.backgroundColor = UIColor(red: 0.3, green: 0.3, blue:
            0.3, alpha: 1)
            signChangeBackground.setTitleColor(.white,for: .normal)
            signChangeBackground.backgroundColor = UIColor(red: 0.3, green: 0.3, blue:
            0.3, alpha: 1)
            modulusBackground.setTitleColor(.white,for: .normal)
            modulusBackground.backgroundColor = UIColor(red: 0.3, green: 0.3, blue:
            0.3, alpha: 1)
            colorButton.setTitleColor(.white,for: .normal)
            
        }
           colorCounter += 1
       }
}

