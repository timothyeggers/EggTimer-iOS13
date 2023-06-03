//
//  ViewController.swift

//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var secondsElapsed : Float = 0.0
    var totalTime : Float = 0.0
    
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timerProgress: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
                  
        secondsElapsed = 0.0
        totalTime = Float(eggTimes[hardness] ?? 0)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsElapsed < totalTime {
            secondsElapsed += 1.0
            timerProgress.progress = secondsElapsed / totalTime
        }
        else {
            timer.invalidate()
            titleLabel.text = "Eggs are done!"
            timerProgress.progress = 1.0
        }
    }
}
