//
//  ThirdViewController.swift
//  CatchTheMcQueen
//
//  Created by pc on 28.02.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var infoLabel: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backButton.layer.cornerRadius =
        self.backButton.frame.size.height/2
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "once") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

}
