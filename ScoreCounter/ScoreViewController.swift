//
//  ScoreViewController.swift
//  ScoreCounter
//
//  Created by Yaric Shkurat on 16/02/2018.
//

import UIKit

class ScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var hpCounterLabel: UILabel!
    @IBOutlet weak var poisonCounterLabel: UILabel!
    @IBOutlet weak var healthBar: UIProgressView!
    @IBOutlet weak var poisonBar: UIProgressView!
    
    var healthCount = 20
    var poisonCount = 0
    
    @IBAction func addHPTapped(_ sender: Any) {
        healthCount += 1
        updateUI()
    }
    
    @IBAction func subHPTapped(_ sender: Any) {
        healthCount -= 1
        updateUI()
    }
    
    @IBAction func addPoisonTapped(_ sender: Any) {
        poisonCount += 1
        updateUI()
    }
    
    @IBAction func subPoisonTapped(_ sender: Any) {
        poisonCount -= 1
        updateUI()
    }
    
    func updateUI() {
        hpCounterLabel.text = String(healthCount)
        poisonCounterLabel.text = String(poisonCount)
        healthBar.progress = netHP
        poisonBar.progress = netPoison
    }
    
    func resetCounters() {
        healthCount = 20
        poisonCount = 0
        updateUI()
    }
    
    var netHP: Float {
        return healthCount <= 0 || poisonCount >= 10 ? 0.0 : Float(healthCount)/20.0
    }
    
    var netPoison: Float {
        if healthCount <= 0 {
            return 10.0
        }
        return poisonCount < 0 ? 0.0 : Float(poisonCount)/10.0
    }
    
    func setAsAnotherPlayers() {
        view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        view.backgroundColor = .black
        hpCounterLabel.textColor = .white
    }
}
