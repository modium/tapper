//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Jaf Crisologo on 2016-03-21.
//  Copyright © 2016 Modium Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView! // implicitly unwrapped variable
    @IBOutlet weak var howMantTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onCoinTapped(sender: AnyObject!) { //Use AnyObject if multiple controls call this
        currentTaps += 1
        
//        tapsLbl.text = "\(currentTaps) Taps"
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
    }

    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        //Validation if game isn't played
        if howMantTapsTxt.text != nil && howMantTapsTxt.text != "" {

            logoImg.isHidden = true
            howMantTapsTxt.isHidden = true
            playBtn.isHidden = true
            
            tapBtn.isHidden = false
            tapsLbl.isHidden = false
            
            maxTaps = Int(howMantTapsTxt.text!)! //take user-defined number and cast into Int
            currentTaps = 0
            
//            tapsLbl.text = "\(currentTaps) Taps"
            updateTapsLbl()
            
        }
        
    }
    
    func restartGame() {
        maxTaps = 0
        howMantTapsTxt.text = ""
        
        logoImg.isHidden = false
        howMantTapsTxt.isHidden = false
        playBtn.isHidden = false
        
        tapBtn.isHidden = true
        tapsLbl.isHidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
}

