//
//  ViewController.swift
//  iBet
//
//  Created by Josh Samuels on 2017-10-09.
//  Copyright © 2017 Josh Samuels. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblDie: UILabel!
    @IBOutlet weak var lblCoin: UILabel!
    @IBOutlet weak var lblCurVal: UILabel!
    @IBOutlet weak var btnGenerate: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblCurVal.text = ""
        btnGenerate.setTitle("Roll", for: UIControl.State.normal)
        
        lblNumber.isHidden = true
        lblCoin.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GenerateValue(_ sender: Any) {
        if (!lblDie.isHidden) {
            lblCurVal.text = String(GenerateDie() + 1)
        } else if (!lblCoin.isHidden) {
            if (GenerateCoin() == 0) {
                lblCurVal.text = "Heads"
            } else {
                lblCurVal.text = "Tails"
            }
        } else {
            lblCurVal.text = String(GenerateNumber() + 1)
        }
    }
    
    @IBAction func ToggleDie(_ sender: Any) {
        lblDie.isHidden = false
        lblNumber.isHidden = true
        lblCoin.isHidden = true
        
        lblCurVal.text = ""
        
        btnGenerate.setTitle("Roll", for: UIControl.State.normal)
    }
    
    @IBAction func ToggleCoin(_ sender: Any) {
        lblDie.isHidden = true
        lblNumber.isHidden = true
        lblCoin.isHidden = false
        
        lblCurVal.text = ""
        
        btnGenerate.setTitle("Flip", for: UIControl.State.normal)
    }
    
    @IBAction func ToggleNumber(_ sender: Any) {
        lblDie.isHidden = true
        lblNumber.isHidden = false
        lblCoin.isHidden = true
        
        lblCurVal.text = ""
        
        btnGenerate.setTitle("Generate", for: UIControl.State.normal)
    }
    
    func GenerateDie() -> Int {
        return (Int)((arc4random_uniform(6)))
    }
    
    func GenerateCoin() -> Int {
        return (Int)((arc4random_uniform(2)))
    }
    
    func GenerateNumber() -> Int {
        return (Int)((arc4random_uniform(100)))
    }
}

