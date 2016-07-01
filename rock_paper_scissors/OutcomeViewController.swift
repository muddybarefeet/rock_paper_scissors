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
    
    @IBOutlet weak var whoWonLabel: UILabel!
    @IBOutlet weak var resultsImage: UIImageView!
    @IBOutlet weak var returnButton: UIButton!
    
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
//        scale image so it fits on landscape
        resultsImage.contentMode = UIViewContentMode.ScaleAspectFill
    }

    
    //    function that gets passed the computersa and users go and then returns who appropriate image reference - trigger on load?
    func findWhoWon (computer: Int, user: Int) -> String {
        if computer == user {
//            then it is a draw
            return "draw"
        } else if user == 1 && computer == 2 {
//        user has 1(rock) comp 2(paper) user loose
            whoWonLabel.text = "You Loose!"
            return "rock-paper"
        } else if user == 1 && computer == 3 {
//        user 1 rock comp 3 scissors user win
            whoWonLabel.text = "You Win!"
            return "rock-scissors"
        } else if user == 2 && computer == 1 {
//        user has 2 paper comp 1 rock user win
            whoWonLabel.text = "You Win!"
            return "rock-paper"
        } else if user == 3 && computer == 1 {
//        user 3 scissors comp has 1 rock user loose
            whoWonLabel.text = "You Loose!"
            return "rock-scissors"
        } else if user == 2 && computer == 3 {
//            user 2 paper and comp 3 scissors user loose
            whoWonLabel.text = "You Loose!"
            return "paper-scissors"
        } else {
//            user 3 scissors and computer 2  paper user win
            whoWonLabel.text = "You Win!"
            return "paper-scissors"
        }
    }
    
//return to main page to play again
    @IBAction func playAgain(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
