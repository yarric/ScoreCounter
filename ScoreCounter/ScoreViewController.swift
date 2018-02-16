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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var counterLabel: UILabel!
    
    var healthCount = 20
    
    @IBAction func addTapped(_ sender: Any) {
        healthCount += 1
        updateUI()
    }
    
    @IBAction func subTapped(_ sender: Any) {
        healthCount -= 1
        updateUI()
    }
    
    func updateUI() {
        counterLabel.text = String(healthCount)
    }
    
    func resetCounter() {
        healthCount = 20
        updateUI()
    }
    
    func setAsAnotherPlayers() {
        view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        view.backgroundColor = .black
        counterLabel.textColor = .white
    }
}
