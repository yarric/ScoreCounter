//
//  ViewController.swift
//  ScoreCounter
//
//  Created by Yaric Shkurat on 07/02/2018.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled = true // prevent the screen from locking
        upperScoreViewController?.setAsAnotherPlayers()
    }

    @IBOutlet weak var fightButton: UIButton!
    
    var upperScoreViewController: ScoreViewController?
    var lowerScoreViewController: ScoreViewController?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func fightTapped(_ sender: Any) {
        let firstStrike = arc4random_uniform(2)
        updateUI(withFightDirection: firstStrike == 0 ? " ▼ " : " ▲ ")
    }
    
    func updateUI(withFightDirection: String) {
        fightButton.setTitle(withFightDirection, for: .normal)
        
        upperScoreViewController?.resetCounters()
        lowerScoreViewController?.resetCounters()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fightButton.setTitle(" ⚔︎ ", for: .normal)
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpperCounterSegue" {
            upperScoreViewController = segue.destination as? ScoreViewController
        } else if segue.identifier == "LowerCounterSegue" {
            lowerScoreViewController = segue.destination as? ScoreViewController
        }
    }
}
