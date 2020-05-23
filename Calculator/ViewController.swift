//
//  ViewController.swift
//  Calculator
//
//  Created by Shubham Arya on 5/8/20.
//  Copyright © 2020 Shubham Arya. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

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
    
    @IBOutlet weak var additionBackground: UIButton!
    @IBOutlet weak var subtractionBackground: UIButton!
    @IBOutlet weak var multiplicationBackground: UIButton!
    @IBOutlet weak var divisionBackground: UIButton!
    @IBOutlet weak var powerBackground: UIButton!
    @IBOutlet weak var modulusBackground: UIButton!
    
    @IBOutlet weak var rootChange: UIButton!
    @IBOutlet weak var piAnde: UIButton!
    @IBOutlet weak var reciprocalBackground: UIButton!
    @IBOutlet weak var percentageBackground: UIButton!
    @IBOutlet weak var signChangeBackground: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //overrideUserInterfaceStyle = .light
        //To make the buttons round
        isEqualToBackground.layer.cornerRadius = isEqualToBackground.frame.width/3
        zeroBackground.layer.cornerRadius = zeroBackground.frame.width/6
        decimalBackground.layer.cornerRadius = decimalBackground.frame.width/3
        oneBackground.layer.cornerRadius = oneBackground.frame.width/3
        twoBackground.layer.cornerRadius = twoBackground.frame.width/3
        threeBackground.layer.cornerRadius = threeBackground.frame.width/3
        fourBackground.layer.cornerRadius = fourBackground.frame.width/3
        fiveBackground.layer.cornerRadius = fiveBackground.frame.width/3
        sixBackground.layer.cornerRadius = sixBackground.frame.width/3
        sevenBackground.layer.cornerRadius = sevenBackground.frame.width/3
        eightBackground.layer.cornerRadius = eightBackground.frame.width/3
        nineBackground.layer.cornerRadius = nineBackground.frame.width/3
        acBackground.layer.cornerRadius = acBackground.frame.width/3
        ceBackground.layer.cornerRadius = ceBackground.frame.width/3
        rootChange.layer.cornerRadius = rootChange.frame.width/3
        piAnde.layer.cornerRadius = piAnde.frame.width/3
        reciprocalBackground.layer.cornerRadius = reciprocalBackground.frame.width/3
        percentageBackground.layer.cornerRadius = percentageBackground.frame.width/3
        signChangeBackground.layer.cornerRadius = signChangeBackground.frame.width/3
        modulusBackground.layer.cornerRadius = modulusBackground.frame.width/3
        paranthesisSwitch.layer.cornerRadius = paranthesisSwitch.frame.width/3
        colorButton.layer.cornerRadius = colorButton.frame.width/3
        additionBackground.layer.cornerRadius = additionBackground.frame.width/3
        subtractionBackground.layer.cornerRadius = subtractionBackground.frame.width/3
        multiplicationBackground.layer.cornerRadius = multiplicationBackground.frame.width/3
        divisionBackground.layer.cornerRadius = divisionBackground.frame.width/3
        powerBackground.layer.cornerRadius = powerBackground.frame.width/3
    }
    var num1 = ""
    var num2 = ""
    var total = ""
    var Operater = " "
    var resultDecimal = Double(0.0)
    var decimalFlagNum1 = false
    var decimalFlagNum2 = false
    var bracketFlag = false
    var pi_eCounter = 0
    var colorCounter = 0
    var bracketCounter = 0
    var rootCounter = 0
    
    /*
     This function checks in a number is valid or not it checks if the Num
     contains inf or nan and if it does then it returns true, i.e. number is invalid
     */
    func checkInvalidNumber ( Num: String=" ") -> (Bool){
        if Num == "inf" || Num == "nan"{
            decimalFlagNum1 = false
            decimalFlagNum2 = false
            return true
        }else{
             return false
        }
    }
    
    /*
     This function is used to round a particular number (num) to decimal
     places (places). It then returns the an integer rnum that is the rounded number
     */
    
    // This prints on calculator
    func printOnCalculator( Num1: String=" ", Operator: String=" ", Num2: String=" "){
        total = num1+Operator+num2
        outputScreen.adjustsFontSizeToFitWidth = true // This adjusts the label as more numbers are typed into it
        outputScreen.text = Num1 + Operator + Num2
    }
    
    // This is used to assign a number and is used when a button is pressed
    func numAssignment(Num1: String="",Operator: String=" ", Num2: String="", number: String=" ") -> (num1:String,num2:String){
        if Operator == " "{
            let Num1 = Num1 + number
            return(Num1,Num2)
        }else{
            let Num2 = Num2 + number
            return(Num1,Num2)
        }
    }
    
    // this function clears the numbers when the user shakes their phones
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            num1 = ""
            num2 = ""
            Operater = " "
            decimalFlagNum1 = false
            decimalFlagNum2 = false
            bracketFlag = false
            printOnCalculator(Num1:"0",Operator:Operater,Num2:num2)
        }
    }
    
     //This function performs all the binary finctions in the caculator
    func operationFunction(Num1: String="",Operator: String=" ",Num2: String="")->(String){
        let numberOne = Int64(num1) ?? 0 //numberOne is the integer version of num1 which is String
        let numberTwo = Int64(num2) ?? 0 //numberTwo is the integer version of num2 which is String
        var numberOneDecimal = Double(num1) ?? 0.0 //numberOneDecimal is the integer version of num1 which is String
        var numberTwoDecimal = Double(num2) ?? 0.0 //numberTwoDecimal is the integer version of num2 which is String
        var num1Count : UInt64 = UInt64(num1.count) //num1Count is the number of characters in num1
        var num2Count : UInt64 = UInt64(num2.count) //num2Count is the number of characters in num2
        /*
         The next 4 if-statements are present to reduce the number of character counts
         for unnecessary characters like a 0 or a '.' So if the num1 is 0.0555
         num1Count will be equal to 4. If num2 is 10.112, then num2Count is 5
         */
        if num1.first == "0"{
            num1Count = num1Count-1
        }
        if num1.contains(".")
        {
            num1Count = num1Count-1
        }
        if num2.first == "0"{
            num2Count = num2Count-1
        }
        if num2.contains(".")
        {
            num2Count = num2Count-1
        }
        var toPlaces = Int64(0) //stores the number of places to move in a Doubleing point
        var result = Int64(0) // stores the result of the 2 operands in integer
        /*
        if num1.count + num2.count > 19 {
            var f  = Double(num1.count)
            var g = Double(num2.count)
            f = f - 1
            g = g - 1
            let divisor1 : Double = pow(10.0,f)
            numberOneDecimal = numberOneDecimal/divisor1 // now in decimal
            print(numberOneDecimal)
            let divisor2 : Double = pow(10.0,g)
            numberTwoDecimal = numberTwoDecimal/divisor2 // now in decimal
            print(numberTwoDecimal)
            resultDecimal = numberTwoDecimal*numberTwoDecimal //one number to the left of the decimal
            // need to output it in scientific form but store it in num1 in actual way
        }
        */
        switch Operator {
        case "+":
             if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = numberOneDecimal + numberTwoDecimal
                num1 = String(resultDecimal)
            }else{
                result = numberOne + numberTwo
                num1 = String(result)
            }
        case "-":
            toPlaces = Int64(max(num1Count,num2Count))
            if decimalFlagNum1 || decimalFlagNum2{
                let numPrecisionDecimal = Double(toPlaces)
                let x : Double = pow(10.0 , numPrecisionDecimal)
                numberOneDecimal = numberOneDecimal * Double(x)
                numberOneDecimal = round(numberOneDecimal)
                numberTwoDecimal = numberTwoDecimal * Double(x)
                numberTwoDecimal = round(numberTwoDecimal)
                resultDecimal = Double(numberOneDecimal) - Double(numberTwoDecimal)
                resultDecimal = resultDecimal/x
                num1 = String(resultDecimal)
            }else{
                result = numberOne - numberTwo
                num1 = String(result)
            }
        case "x":
            toPlaces = Int64(num1Count + num2Count)
            if decimalFlagNum1 || decimalFlagNum2{
                let numPrecisionDecimal = Double(toPlaces)
                let x = pow(10.0 , numPrecisionDecimal)
                let x1 = pow(10.0,Double(num1Count))
                let x2 = pow(10.0,Double(num2Count))
                numberOneDecimal = numberOneDecimal * Double(x1)
                numberOneDecimal = round(numberOneDecimal)
                numberTwoDecimal = numberTwoDecimal * Double(x2)
                numberTwoDecimal = round(numberTwoDecimal)
                resultDecimal = Double(numberOneDecimal) * Double(numberTwoDecimal)
                resultDecimal=resultDecimal/x
                num1 = String(resultDecimal)
            }else{
                result = numberOne * numberTwo
                num1 = String(result)
            }
        case "^":
            if decimalFlagNum1 || decimalFlagNum2{
                if num1 == "\(Double.pi)" || num1 == "2.7182818"{
                    resultDecimal =  pow(numberOneDecimal , numberTwoDecimal)
                }else{
                    let numPrecisionDecimal = Double(num1Count)
                    var x = pow(10.0 , numPrecisionDecimal)
                    numberOneDecimal = numberOneDecimal*x
                    x = pow(x,numberTwoDecimal)
                    resultDecimal = pow(numberOneDecimal , numberTwoDecimal)
                    resultDecimal=resultDecimal/x
                }
                num1 = String(resultDecimal)
            }else{
                result = 1
                if numberTwo == 0{
                    result = 1
                    num1 = String(result)
                }else{
                    if numberTwo >= 0{
                        for _ in 0..<numberTwo{
                            result = result*numberOne
                        }
                        num1 = String(result)
                    }else{
                        resultDecimal = pow(numberOneDecimal , numberTwoDecimal)
                        decimalFlagNum1=true
                        decimalFlagNum2=true
                        num1 = String(resultDecimal)
                    }
                }
            }
        case "÷":
            toPlaces = Int64(max(num1Count,num2Count))
            if decimalFlagNum1 || decimalFlagNum2{
                let num1PrecisionDecimal = Double(toPlaces)
                let x1 = pow(10.0 , num1PrecisionDecimal)
                numberOneDecimal = numberOneDecimal * Double(x1)
                numberTwoDecimal = numberTwoDecimal * Double(x1)
                resultDecimal = numberOneDecimal / numberTwoDecimal
                num1 = String(resultDecimal)
            }else{
                resultDecimal = Double(numberOne)/Double(numberTwo)
                num1 = String(resultDecimal)
            }
        case "mod":
            toPlaces = Int64(max(num1Count,num2Count))
            if decimalFlagNum1 || decimalFlagNum2{
                let num1PrecisionDecimal = Double(toPlaces)
                let x = pow(10.0 , num1PrecisionDecimal)
                numberOneDecimal = numberOneDecimal * Double(x)
                numberTwoDecimal = numberTwoDecimal * Double(x)
                
                resultDecimal = numberOneDecimal.remainder(dividingBy: numberTwoDecimal)
                if resultDecimal < 0{
                    resultDecimal = resultDecimal + numberTwoDecimal
                }
                resultDecimal = resultDecimal/x
                num1 = String(resultDecimal)
            }else{
                if numberOne < numberTwo{
                    result = 0
                }else{
                    result = numberOne % numberTwo
                }
                num1 = String(result)
            }
        default:
            if decimalFlagNum1 || decimalFlagNum2{
                resultDecimal = numberOneDecimal
                num1 = String(resultDecimal)
            }else{
                result = numberOne
                num1 = String(result)
            }
        }
        
        return num1
    }
    
    @IBAction func zero(_ sender: UIButton) {
        if Operater == " "{
            if num1 != "" && num1 != "\(Double.pi)" && num1 != "2.7182818"{
                num1 = num1 + "0"
            }
        }else
        {
            num2 = num2 + "0"
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }

    //This is for the assignment of numbers from 1-9 when the respective button is clicked
    @IBAction func numberOneToNine(_ sender: UIButton) {
        (num1,num2) = numAssignment(Num1:num1,Operator:Operater,Num2:num2,number:sender.currentTitle!)
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func pi(_ sender: UIButton) {
        if pi_eCounter%2 == 0{ // pi = 3.1415
            piAnde.setTitle("e", for: .normal)
            if Operater == " "{
            num1 = "\(Float.pi)"
            decimalFlagNum1 = true
            }else
            {
                num2 = "\(Float.pi)"
                decimalFlagNum2 = true
            }
        }else{  // e = 2.71828
            piAnde.setTitle("π", for: .normal)
            if Operater == " "{
                num1 = "2.7182818"
            decimalFlagNum1 = true
            }else
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
            }else{
                if !decimalPresentNum1{
                num1 = num1 + "."
                }
            }
            decimalFlagNum1 = true
        }else
        {
            for point in num2{
                if point == "."{
                    decimalPresentNum2 = true
                }
            }
            if num2 == "" && !decimalPresentNum2{
                num2 = num2 + "0."
            }else{
                if !decimalPresentNum2{
                    num2 = num2 + "."
                }
            }
            decimalFlagNum2 = true
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    /*
     When any grey button is clicked, this operation will be triggered.
     This function sets the operator using sender.currentTitle
     This can set the operator to ADD, SUBTRACT, MULTIPLY, DIVIDE,
     POWER and MODULUS. These are all the binary operators available in
     the calculator.
     */
    @IBAction func greyButtons(_ sender: UIButton) {
        /*
         If there is already an Operator then it will act as = and find
         tbe result with that operator. it will then set it to num1 and set
         it to the operator clicked.
        */
        if Operater != " "{
            num1 = operationFunction(Num1: num1, Operator: Operater, Num2: num2)
            Operater = sender.currentTitle!
            num2 = ""
            if checkInvalidNumber(Num: num1){
                // When the number is invalid, it reassigns Operater and num1
                Operater = " "
                printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
                num1 = ""
            }else{
                printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
            }
        }else{
            Operater = sender.currentTitle!
            if num1 == ""{ //if there is no num1, then it sets it to 0
                num1 = "0"
            }
            printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
        }
        if Operater == "÷"{ //setting of decimal flag when the Operator is divide
            decimalFlagNum1 = true
            decimalFlagNum2 = true
        }
    }
    
    @IBAction func root(_ sender: UIButton) {
        var numberOne = Double(num1) ?? 0
        let numberTwo = Double(num2) ?? 0
        var rootNumberFlag = false
        if rootCounter%2 == 0{
            // to fimd square root
            rootChange.setTitle("∛", for: .normal)
            //DoubleTapped(rc: rootCounter)
            if Operater == " "{
                resultDecimal = pow(Double(numberOne),Double(0.5))
                num1 = String(resultDecimal)
                decimalFlagNum1 = true
            }else{
                resultDecimal = pow(Double(numberTwo),Double(0.5))
                num2 = String(resultDecimal)
                decimalFlagNum2 = true
            }
        }else{
            //to find cube root
            rootChange.setTitle("√", for: .normal)
            // DoubleTapped(rc:rootCounter)
            if Operater == " "{
               // print(numberOne)
                if numberOne < 0{
                    numberOne = abs(numberOne)
                    rootNumberFlag = true
                }
                if rootNumberFlag{
                    resultDecimal = -1*pow(Double(numberOne),Double(0.33333333))
                }else{
                    resultDecimal = pow(Double(numberOne),Double(0.33333333))
                }
                num1 = String(resultDecimal)
                decimalFlagNum1 = true
            }else{
                resultDecimal = pow(Double(numberTwo),Double(0.33333333))
                num2 = String(resultDecimal)
                decimalFlagNum2 = true
            }
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
        num2 = ""
        rootNumberFlag = false
        rootCounter += 1
    }
    @IBAction func percentage(_ sender: UIButton) {
        let numberOne = Double(num1) ?? 0
        let numberTwo = Double(num2) ?? 0
        if Operater == " "{
            resultDecimal = Double(numberOne)/Double(100)
            num1 = String(resultDecimal)
            decimalFlagNum1 = true
        }else{
             resultDecimal = Double(numberTwo)/Double(100)
             num2 = String(resultDecimal)
            decimalFlagNum2 = true
        }
         printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    @IBAction func reciprocal(_ sender: UIButton) {
        let numberOne = Double(num1) ?? 0
        let numberTwo = Double(num2) ?? 0
        if Operater == " "{
            resultDecimal = Double(1)/Double(numberOne)
            num1 = String(resultDecimal)
            decimalFlagNum1 = true
        } else {
             resultDecimal = Double(1)/Double(numberTwo)
             num2 = String(resultDecimal)
            decimalFlagNum2 = true
        }
         printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
    
    //This function clears all the numbers and Operators,
    //sets all the flags and outputs 0 on screen
    @IBAction func allClear(_ sender: UIButton) {
        outputScreen.text = "0"
        num1 = ""
        num2 = ""
        Operater = " "
        decimalFlagNum1 = false
        decimalFlagNum2 = false
    }
    
    //This function clears one element at a time
    @IBAction func clearEntry(_ sender: UIButton) {
        //when there is no operator and num1 is not empty, it removes the last
        //element in num1. If there is an operator and num2 is empty, then it resets the
        //Operator to empty. Otherwise, it removes the last element of num2.
        //It num1 or num2 contain a decimal in it, the decimalFlags remain true. otherwise they
        // are switched to false. when num1 or 2 is 0, CE will make the string = ""
        if Operater == " "{
            if num1 != ""{
                num1.removeLast()
            }
        } else if Operater != " " && num2 == ""{
            if Operater.removeLast() == "÷"{
                decimalFlagNum1 = false
                decimalFlagNum2 = false
            }
            Operater = " "
        } else {
            num2.removeLast()
        }
        
        if num1.contains(".") || num2.contains("."){
            decimalFlagNum1 = true
        } else {
            decimalFlagNum1 = false
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
        if num1 == "0"{
            num1 = ""
        }
        if num2 == "0"{
            num2 = ""
        }
    }
    @IBAction func changeSign(_ sender: UIButton) {
        let temp = Int(num1) ?? 0
        let decTemp = Double(num1) ?? 0.0
        let temp2 = Int(num2) ?? 0
        let decTemp2 = Double(num2) ?? 0.0
        if Operater == " "{
            if temp<0 || decTemp<0 || num1 == "-"{
                num1 = num1.replacingOccurrences(of: "-",with: "")
            } else {
                num1 = "-"+num1
            }
        } else {
            if temp2<0 || decTemp2<0 || num2 == "-"{
                num2 = num2.replacingOccurrences(of: "-",with: "")
            } else {
                num2 = "-"+num2
            }
        }
        printOnCalculator(Num1:num1,Operator:Operater,Num2:num2)
    }
        
    @IBAction func openCloseBracket(_ sender: UIButton) {
        if bracketCounter%2 == 0{ //BRACKET IS OPEN
            paranthesisSwitch.setTitle(")", for: .normal)
            bracketFlag = true
        } else { //BRACKET IS CLOSED
            paranthesisSwitch.setTitle("(", for: .normal)
            bracketFlag = false
        }
        bracketCounter += 1
    }
    
    @IBAction func isEqualTo(_ sender: UIButton) {
        num1 = operationFunction(Num1:num1,Operator:Operater,Num2:num2)
        if num1 == "nan" || num1 == "inf"{
            outputScreen.text = "Error"
            num1 = ""
        } else if (num1 == "80085" && num2=="") || num1 == "80085"{
            outputScreen.text = "BOOBS"
        } else if decimalFlagNum2 || decimalFlagNum1 || Operater == "÷"{
            outputScreen.text = num1
        } else if Operater == " " || Operater == "+"{
            outputScreen.text = num1
        } else {
            outputScreen.text = num1
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
        }else if colorCounter%3 == 2{
            // Light MODE
            outputScreen.backgroundColor = #colorLiteral(red: 0.119865723, green: 0.1295052469, blue: 0.142410785, alpha: 1)
            outputScreen.textColor = UIColor.white
            backgroundView.backgroundColor =  #colorLiteral(red: 0.119865723, green: 0.1295052469, blue: 0.142410785, alpha: 1)
            zeroBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            zeroBackground.setTitleColor(.black,for: .normal)
            oneBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            oneBackground.setTitleColor(.black,for: .normal)
            twoBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            twoBackground.setTitleColor(.black,for: .normal)
            threeBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            threeBackground.setTitleColor(.black,for: .normal)
            fourBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            fourBackground.setTitleColor(.black,for: .normal)
            fiveBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            fiveBackground.setTitleColor(.black,for: .normal)
            sixBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            sixBackground.setTitleColor(.black,for: .normal)
            sevenBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            sevenBackground.setTitleColor(.black,for: .normal)
            eightBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            eightBackground.setTitleColor(.black,for: .normal)
            nineBackground.backgroundColor = #colorLiteral(red: 0.9490928054, green: 0.9487083554, blue: 0.970439136, alpha: 1)
            nineBackground.setTitleColor(.black,for: .normal)
            colorButton.setTitle("Light", for: .normal)
            colorButton.setTitleColor(.black,for: .normal)
            colorButton.backgroundColor = .systemOrange
            ceBackground.setTitleColor(.black,for: .normal)
            ceBackground.backgroundColor = .systemOrange
            acBackground.setTitleColor(.black,for: .normal)
            acBackground.backgroundColor = .systemOrange
            paranthesisSwitch.setTitleColor(.black,for: .normal)
            paranthesisSwitch.backgroundColor = .systemOrange
            isEqualToBackground.backgroundColor = .systemOrange
            decimalBackground.setTitleColor(.black,for: .normal)
            decimalBackground.backgroundColor = .systemOrange
            piAnde.setTitleColor(.black,for: .normal)
            piAnde.backgroundColor = #colorLiteral(red: 0.2701534927, green: 0.6156945229, blue: 0.8014627099, alpha: 1)
            rootChange.setTitleColor(.black,for: .normal)
            rootChange.backgroundColor = #colorLiteral(red: 0.2701534927, green: 0.6156945229, blue: 0.8014627099, alpha: 1)
            reciprocalBackground.setTitleColor(.black,for: .normal)
            reciprocalBackground.backgroundColor = #colorLiteral(red: 0.2701534927, green: 0.6156945229, blue: 0.8014627099, alpha: 1)
            percentageBackground.setTitleColor(.black,for: .normal)
            percentageBackground.backgroundColor = #colorLiteral(red: 0.2701534927, green: 0.6156945229, blue: 0.8014627099, alpha: 1)
            signChangeBackground.setTitleColor(.black,for: .normal)
            signChangeBackground.backgroundColor = #colorLiteral(red: 0.2701534927, green: 0.6156945229, blue: 0.8014627099, alpha: 1)
            modulusBackground.setTitleColor(.black,for: .normal)
            powerBackground.setTitleColor(.black,for: .normal)
            divisionBackground.setTitleColor(.black,for: .normal)
            multiplicationBackground.setTitleColor(.black,for: .normal)
            additionBackground.setTitleColor(.black,for: .normal)
            subtractionBackground.setTitleColor(.black,for: .normal)
            colorButton.setTitleColor(.black,for: .normal)
        }else{
            // NIGHT MODE
            outputScreen.backgroundColor = #colorLiteral(red: 0.07449776679, green: 0.07451825589, blue: 0.07449506968, alpha: 1)
            backgroundView.backgroundColor = #colorLiteral(red: 0.07449776679, green: 0.07451825589, blue: 0.07449506968, alpha: 1)
            outputScreen.textColor = .white
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
            colorButton.setTitle("Dark", for: .normal)
            colorButton.backgroundColor = #colorLiteral(red: 0.1490006149, green: 0.1490328908, blue: 0.148996383, alpha: 1)
            ceBackground.setTitleColor(.white,for: .normal)
            ceBackground.backgroundColor = #colorLiteral(red: 0.1490006149, green: 0.1490328908, blue: 0.148996383, alpha: 1)
            acBackground.setTitleColor(.white,for: .normal)
            acBackground.backgroundColor = #colorLiteral(red: 0.1490006149, green: 0.1490328908, blue: 0.148996383, alpha: 1)
            paranthesisSwitch.setTitleColor(.white,for: .normal)
            paranthesisSwitch.backgroundColor = #colorLiteral(red: 0.1490006149, green: 0.1490328908, blue: 0.148996383, alpha: 1)
            decimalBackground.setTitleColor(.white,for: .normal)
            decimalBackground.backgroundColor = #colorLiteral(red: 0.1490006149, green: 0.1490328908, blue: 0.148996383, alpha: 1)
            piAnde.setTitleColor(.white,for: .normal)
            piAnde.backgroundColor = #colorLiteral(red: 0.3019275367, green: 0.3019839823, blue: 0.3019200563, alpha: 1)
            rootChange.setTitleColor(.white,for: .normal)
            rootChange.backgroundColor = #colorLiteral(red: 0.3019275367, green: 0.3019839823, blue: 0.3019200563, alpha: 1)
            reciprocalBackground.setTitleColor(.white,for: .normal)
            reciprocalBackground.backgroundColor = #colorLiteral(red: 0.3019275367, green: 0.3019839823, blue: 0.3019200563, alpha: 1)
            percentageBackground.setTitleColor(.white,for: .normal)
            percentageBackground.backgroundColor = #colorLiteral(red: 0.3019275367, green: 0.3019839823, blue: 0.3019200563, alpha: 1)
            signChangeBackground.setTitleColor(.white,for: .normal)
            signChangeBackground.backgroundColor = #colorLiteral(red: 0.3019275367, green: 0.3019839823, blue: 0.3019200563, alpha: 1)
            modulusBackground.setTitleColor(.white,for: .normal)
            powerBackground.setTitleColor(.white,for: .normal)
            divisionBackground.setTitleColor(.white,for: .normal)
            multiplicationBackground.setTitleColor(.white,for: .normal)
            additionBackground.setTitleColor(.white,for: .normal)
            subtractionBackground.setTitleColor(.white,for: .normal)
            colorButton.setTitleColor(.white,for: .normal)
        }
        colorCounter += 1
    }
}
