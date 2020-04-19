//
//  ViewController.swift
//  w2Calculator
//
//  Created by Sherwin on 2020-01-15.
//  Copyright © 2020 Sherwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let Plus  = 10
    let MInus = 11
    let Multiply = 12
    let divide = 13
    
    var num1 : Int = 0
    var num2 : Int = 0
    var answer : Double = 0.0
    var operand :Int = 0
    
    @IBOutlet var lbtext : UILabel!
    var theNumber : String = "0"
    
    
    
    @IBAction func calculate(sender: UIButton)
    
    {
        num2 = Int(theNumber)!
        if (operand == Plus)
        {
            answer = Double (num1 + num2)
            
            
        }
        else if (operand == MInus)
        
        {
            answer = Double (num1 - num2)
            
        }
        else if (operand == Multiply)
        {
            
            answer =  Double(Int(num1 * num2))
            
        }
        else
        
        {
            
            if num2 == 0
            {
                let alert = UIAlertController(title: "Error", message: "canot divide by zero", preferredStyle: .actionSheet)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alert.addAction(cancelAction)
                present(alert,animated: true)
            }
            else{
            
            answer = Double (num1) / Double(num2)
            }
        }
        
        theNumber = String(answer)
        printNumber()
        num1 = 0
        num2 = 0
        answer = 0.0
    
        
    }
    
    
    @IBAction func clearNum(sender : UIButton)
    {
        
        theNumber = "0"
        printNumber()
        
    }
    
    
    
    func saveNum1()
    {
        
        num1 = Int(theNumber)!
        theNumber="0"
        printNumber()
        
    }
    
    
    
    @IBAction func setOperand (sender : UIButton)
    {
        
        
        if sender.tag >= Plus && sender.tag <= divide
        {
            operand = sender.tag
            saveNum1()
            
            
            
        }
    }
    
    @IBAction func pressNum(sender : UIButton )
    {
        if (sender.tag >= 0 && sender.tag <= 9 )
        {
            
            if ( theNumber == "0")
            {
                theNumber=""
                
            }
            
            theNumber += String (sender.tag)
            printNumber()
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        printNumber()
    
    
    }
    
    func printNumber()
    
    {
        lbtext.text = theNumber
        
    }


}

