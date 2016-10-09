//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Juan Manuel Jimenez Sanchez on 9/10/16.
//  Copyright © 2016 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var scissorsImage: UIImageView!
    @IBOutlet var scissorsImageMachine: UIImageView!
    @IBOutlet var paperImage: UIImageView!
    @IBOutlet var paperImageMachine: UIImageView!
    @IBOutlet var rockImage: UIImageView!
    @IBOutlet var rockImageMachine: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = ""
        
        scissorsImage.isHidden = true
        paperImage.isHidden = true
        rockImage.isHidden = true
        
        scissorsImageMachine.isHidden = true
        paperImageMachine.isHidden = true
        rockImageMachine.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        play(userOption: 2)
    }
    
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        play(userOption: 1)
    }
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(userOption: 0)
    }
    
    func play(userOption: Int) {
        let randomNumber = Int(arc4random_uniform(3))
        let randomMessage = Int(arc4random_uniform(3))

        let winMessages = ["You win. You are the best!!", "Congrats!, you are the winner.", "You are awesome! you are the one!"]
        let LoseMessages = ["You are a looser! hahaha", "you stink!, you had lose.", "You lose, I wish you good luck the next time"]
        let tieMessages = ["seriously? it is a tie!", "Is it a joke?", "Are you kidding me?"]
        
        if (userOption == 0 && randomNumber == 1) || (userOption == 1 && randomNumber == 2) || (userOption == 2 && randomNumber == 0) {
            resultLabel.text = LoseMessages[randomMessage]
            resultLabel.textColor = UIColor.red
        } else if userOption == randomNumber {
            resultLabel.text = tieMessages[randomMessage]
            resultLabel.textColor = UIColor.black
        } else {
            resultLabel.text = winMessages[randomMessage]
            resultLabel.textColor = UIColor.green
        }
        
        //Elección de la máquina
        switch randomNumber {
        case 0:
            scissorsImage.isHidden = true
            paperImage.isHidden = true
            rockImage.isHidden = false
        case 1:
            scissorsImage.isHidden = true
            paperImage.isHidden = false
            rockImage.isHidden = true
        default:
            scissorsImage.isHidden = false
            paperImage.isHidden = true
            rockImage.isHidden = true
        }
        
        //Elección del usuario
        switch userOption {
        case 0:
            scissorsImageMachine.isHidden = true
            paperImageMachine.isHidden = true
            rockImageMachine.isHidden = false
        case 1:
            scissorsImageMachine.isHidden = true
            paperImageMachine.isHidden = false
            rockImageMachine.isHidden = true
        default:
            scissorsImageMachine.isHidden = false
            paperImageMachine.isHidden = true
            rockImageMachine.isHidden = true
        }
    }
}

