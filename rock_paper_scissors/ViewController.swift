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
        rock.tag = 1
        paper.tag = 2
//        scissors.tag = 3
    }

//    way to pass data for the non-manual segues
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
    
//    generate a number to relate the the turn of the computer
    func genComputerTurn () -> Int {
        let randomNumber = 1 + arc4random() % 3;
        return Int(randomNumber)
    }
    
//    manual segue
    @IBAction func userTurn(sender: AnyObject) {
        if sender.tag == 2 {
            performSegueWithIdentifier("scissorsChoice", sender: self)
        }
        if sender.tag == 1 {
            var controllerCode:OutcomeViewController
            controllerCode = storyboard?.instantiateViewControllerWithIdentifier("OutcomeViewController") as! OutcomeViewController
            controllerCode.userTurn = sender.tag
            controllerCode.computerTurn = genComputerTurn()
            
            presentViewController(controllerCode, animated: true, completion: nil)
        }
    }
    
}

