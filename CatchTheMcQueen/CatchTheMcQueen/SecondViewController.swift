//
//  SecondViewController.swift
//  CatchTheMcQueen
//
//  Created by pc on 27.02.2023.
//

import UIKit
import AVFoundation



class SecondViewController: UIViewController {

    var player: AVAudioPlayer!
    var score = 0
    var timer = Timer()
    var counter = 0
    var mcArray = [UIImageView]()
    var hideTimer = Timer()
    var highscore = 0
    
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    
    
    
    
    @IBOutlet weak var mcquenn1: UIImageView!
    @IBOutlet weak var mcquenn2: UIImageView!
    @IBOutlet weak var mcquenn3: UIImageView!
    @IBOutlet weak var mcquenn4: UIImageView!
    @IBOutlet weak var mcquenn5: UIImageView!
    @IBOutlet weak var mcquenn6: UIImageView!
    @IBOutlet weak var mcquenn7: UIImageView!
    @IBOutlet weak var mcquenn8: UIImageView!
    @IBOutlet weak var mcquenn9: UIImageView!
    
    @IBOutlet weak var mcqueenn3: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.layer.zPosition = -1
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil{
            highscore = 0
            highscoreLabel.text = "Highscore: \(highscore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highscore = newScore
            highscoreLabel.text = "Highscore: \(highscore)"
        }
        
        
        self.finishButton.layer.cornerRadius =
        self.finishButton.frame.size.height/2

        
        
        
        scoreLabel.text = "Score: \(score)"
        
        mcquenn1.isUserInteractionEnabled = true
        mcquenn2.isUserInteractionEnabled = true
        mcqueenn3.isUserInteractionEnabled = true
        mcquenn4.isUserInteractionEnabled = true
        mcquenn5.isUserInteractionEnabled = true
        mcquenn6.isUserInteractionEnabled = true
        mcquenn7.isUserInteractionEnabled = true
        mcquenn8.isUserInteractionEnabled = true
        mcquenn9.isUserInteractionEnabled = true
        
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        mcquenn1.addGestureRecognizer(recognizer1)
        mcquenn2.addGestureRecognizer(recognizer2)
        mcqueenn3.addGestureRecognizer(recognizer3)
        mcquenn4.addGestureRecognizer(recognizer4)
        mcquenn5.addGestureRecognizer(recognizer5)
        mcquenn6.addGestureRecognizer(recognizer6)
        mcquenn7.addGestureRecognizer(recognizer7)
        mcquenn8.addGestureRecognizer(recognizer8)
        mcquenn9.addGestureRecognizer(recognizer9)
        
        
        mcArray = [mcquenn1, mcquenn2, mcqueenn3, mcquenn4, mcquenn5, mcquenn6, mcquenn7, mcquenn8, mcquenn9]
        
        
        counter = 20
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideMcQueen), userInfo: nil, repeats: true)
        
       hideMcQueen()
        
    }
    
    
    @objc func hideMcQueen(){
        for mc_queen in mcArray{
            mc_queen.isHidden = true
        }
        
       let random = Int( arc4random_uniform(UInt32(mcArray.count - 1)))
        
        mcArray[random].isHidden = false
    }
    
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    
    @objc func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        if(counter == 0){
            timer.invalidate()
            hideTimer.invalidate()
            for mc_queen in mcArray{
                mc_queen.isHidden = true
            }
            let alert = UIAlertController(title: "Time's up", message: "Do you want play again ?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                self.score=0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 20
                self.timeLabel.text = String(self.counter)
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideMcQueen), userInfo: nil, repeats: true)
               
                let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
                
                if storedHighScore == nil{
                    self.highscore = 0
                    self.highscoreLabel.text = "Highscore: \(self.highscore)"
                }
                
                if let newScore = storedHighScore as? Int {
                    self.highscore = newScore
                    self.highscoreLabel.text = "Highscore: \(self.highscore)"
                }
            }
            
            if self.score > self.highscore {
                self.highscore = self.score
            }
            
            UserDefaults.standard.set(self.highscore, forKey: "highscore")
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    @IBAction func finishButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "once") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    func playSound(){
        let url = Bundle.main.url(forResource: "song", withExtension: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
    func stopSound(){
        let url = Bundle.main.url(forResource: "song", withExtension: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.stop()
    }
    
}
