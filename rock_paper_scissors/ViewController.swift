//
//  ViewController.swift
//  rock_paper_scissors
//
//  Created by Anna Rogers on 6/29/16.
//  Copyright © 2016 Anna Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var paper: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loading .....")
        let a = genComputerTurn()
        print("user turn", a)
        rock.tag = 1
        paper.tag = 2
        scissors.tag = 3
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! OutcomeViewController
        controller.computerTurn = genComputerTurn()
        if segue.identifier == "paperChoice" {
            controller.userTurn = 2
        }
        if segue.identifier == "scissorsChoice" {
            controller.userTurn = 3
        }
    }
    
    func genComputerTurn () -> Int {
        let randomNumber = 1 + arc4random() % 3;
        return Int(randomNumber)
    }
    
    @IBAction func userTurn(sender: AnyObject) {
        print("clicked", sender)
        if sender.tag == 2 {
            print("scissors chosen")
            performSegueWithIdentifier("scissorsChoice", sender: self)
        }
        if sender.tag == 1 {
            print("rock chosen")
            var controllerCode:OutcomeViewController
            controllerCode = storyboard?.instantiateViewControllerWithIdentifier("OutcomeViewController") as! OutcomeViewController
            controllerCode.userTurn = sender.tag
            controllerCode.computerTurn = genComputerTurn()
            
            presentViewController(controllerCode, animated: true, completion: nil)
        }
    }
    
}

