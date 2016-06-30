//
//  OutcomeViewController.swift
//  rock_paper_scissors
//
//  Created by Anna Rogers on 6/30/16.
//  Copyright © 2016 Anna Rogers. All rights reserved.
//

import UIKit

class OutcomeViewController: UIViewController {
    
    var userTurn: Int?
    var computerTurn: Int?
    
    @IBOutlet weak var resultsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        unwrap the optional values else do not show anything!
        if let computerGo = computerTurn {
            if let userGo = userTurn {
                let findImage = findWhoWon(computerGo, user: userGo)
                resultsImage.image = UIImage(named:findImage)
            }
        } else {
           resultsImage.image = nil
        }
        resultsImage.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.8) {
            self.resultsImage.alpha = 1
        }
    }
    
    //    function that gets passed the computersa and users go and then returns who appropriate image reference - trigger on load?
    func findWhoWon (computer: Int, user: Int) -> String {
        if computer == user {
//            then it is a draw
            return "draw"
        } else if user == 1 && computer == 2 {
//        user has 1(rock) comp 2(paper) user loose
            return "rock-paper"
        } else if user == 1 && computer == 3 {
//        user 1 rock comp 3 scissors user win
            return "rock-scissors"
        } else if user == 2 && computer == 1 {
//        user has 2 paper comp 1 rock user win
            return "rock-paper"
        } else if user == 3 && computer == 1 {
//        user 3 scissors comp has 1 rock user loose
            return "rock-scissors"
        } else if user == 2 && computer == 3 {
//            user 2 paper and comp 3 scissors user loose
            return "paper-scissors"
        } else {
//            user 3 scissors and computer 2  paper user win
            return "paper-scissors"
        }
    }
    
//return to main page to play again
    @IBAction func playAgain(sender: AnyObject) {
        print("return to main page")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
