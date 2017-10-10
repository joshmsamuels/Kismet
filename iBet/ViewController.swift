//
//  ViewController.swift
//  iBet
//
//  Created by Josh Samuels on 2017-10-09.
//  Copyright © 2017 Josh Samuels. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Die Object Variables
    @IBOutlet weak var dieContainer: UIView!
    @IBOutlet weak var lblDieTitle: UILabel!
    @IBOutlet weak var lblPrevDiePrompt: UILabel!
    @IBOutlet weak var lblCurDiePrompt: UILabel!
    @IBOutlet weak var lblPrevDie: UILabel!
    @IBOutlet weak var lblCurDie: UILabel!
    
    //Coin Object Variables
    @IBOutlet weak var coinContainer: UIView!
    @IBOutlet weak var lblCoinTitle: UILabel!
    @IBOutlet weak var lblPrevCoinPrompt: UILabel!
    @IBOutlet weak var lblCurCoinPrompt: UILabel!
    @IBOutlet weak var lblPrevCoin: UILabel!
    @IBOutlet weak var lblCurCoin: UILabel!
    
    //Number Object Variables
    @IBOutlet weak var numberContainer: UIView!
    @IBOutlet weak var lblNumberContainer: UILabel!
    @IBOutlet weak var lblPrevNumberPrompt: UILabel!
    @IBOutlet weak var lblCurNumberPrompt: UILabel!
    @IBOutlet weak var lblPrevNumber: UILabel!
    @IBOutlet weak var lblCurNumber: UILabel!

    //Button Object Variables
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var btnRollDie: UIButton!
    @IBOutlet weak var btnFlipCoin: UIButton!
    @IBOutlet weak var btnNumber: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ClearLabels(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RollDie(_ sender: Any) {
        let dieValue : Int = (Int)((arc4random_uniform(6)))
        
        lblPrevDie.text = lblCurDie.text
        lblCurDie.text = String(dieValue + 1)
    }
    
    @IBAction func FlipCoin(_ sender: Any) {
        let coinValue : Int = (Int)((arc4random_uniform(2)))
        
        lblPrevCoin.text = lblCurCoin.text
        if (coinValue == 0) {
            lblCurCoin.text = "Heads"
        } else {
            lblCurCoin.text = "Tails"
        }
    }
    
    @IBAction func GenerateNumber(_ sender: Any) {
        let lowerBound : Int = 1
        let upperBound : Int = 100
        
        let number : Int = Int(arc4random_uniform(UInt32(abs(upperBound - lowerBound) + 1))) + lowerBound // generic formula to generate between x and y
        
        lblPrevNumber.text = lblCurNumber.text
        lblCurNumber.text = String(number)
    }
    
    @IBAction func ClearLabels(_ sender: Any) {
        lblPrevDie.text = ""
        lblCurDie.text = ""
        
        lblPrevCoin.text = ""
        lblCurCoin.text = ""
        
        lblPrevNumber.text = ""
        lblCurNumber.text = ""
    }
}

