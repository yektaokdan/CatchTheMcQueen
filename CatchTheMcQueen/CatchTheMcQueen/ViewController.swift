//
//  ViewController.swift
//  CatchTheMcQueen
//
//  Created by pc on 27.02.2023.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    
    var player: AVAudioPlayer!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playButton.layer.cornerRadius =
        self.playButton.frame.size.height/2
        self.aboutButton.layer.cornerRadius =
        self.aboutButton.frame.size.height/2
        playSound()
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        stopSound()
        let vc = storyboard?.instantiateViewController(identifier: "second") as! SecondViewController
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
  

    @IBAction func aboutButton(_ sender: Any) {
        stopSound()
        let vc = storyboard?.instantiateViewController(identifier: "third") as! ThirdViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

