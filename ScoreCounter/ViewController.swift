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
        upperCounterView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)) // turn it to the opponent
    }

    @IBOutlet weak var upperCounterView: UIView!
    @IBOutlet weak var upperCounterLabel: UILabel!
    @IBOutlet weak var lowerCounterView: UIView!
    @IBOutlet weak var lowerCounterLabel: UILabel!
    @IBOutlet weak var fightButton: UIButton!
    
    var upperHealthCount = 20
    var lowerHealthCount = 20
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addUpperTapped(_ sender: Any) {
        upperHealthCount += 1 // add one
        updateUI()
    }
    
    @IBAction func subUpperTapped(_ sender: Any) {
        upperHealthCount -= 1
        updateUI()
    }
    
    @IBAction func addLowerTapped(_ sender: Any) {
        lowerHealthCount += 1
        updateUI()
    }
    
    @IBAction func subLowerTapped(_ sender: Any) {
        lowerHealthCount -= 1
        updateUI()
    }
    
    @IBAction func fightTapped(_ sender: Any) {
        upperHealthCount = 20
        lowerHealthCount = 20
        updateUI()
        
        let firstStrike = arc4random_uniform(2)
        if firstStrike == 0 {
            fightButton.setTitle(" ▼ ", for: .normal)
        } else if firstStrike == 1 {
            fightButton.setTitle(" ▲ ", for: .normal)
        }
    }
    
    func updateUI() {
        upperCounterLabel.text = String(upperHealthCount)
        lowerCounterLabel.text = String(lowerHealthCount)
        fightButton.setTitle(" ⚔︎ ", for: .normal)
    }
}
