//
//  ViewController.swift
//  test1_c14190040_davidivan
//
//  Created by IOS on 3/17/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var rand=Int.random(in: 1...25)
    var lives=5
    
    @IBOutlet var arrButton: [UIButton]!
    
    @IBAction func ResetButton(_ sender: UIButton) {
        resetgame()
    }
    @IBOutlet var livescounter: UITextView!
    
    @IBAction func buttonguess(_ sender: UIButton) {
        if(sender.titleLabel?.text==String(rand)){
            sender.backgroundColor=UIColor.green
            sender.tintColor=UIColor.green
            livescounter.text="YOU WIN"
            for allbutton in arrButton{
                allbutton.isUserInteractionEnabled=false
            }
        }
        else{
            sender.backgroundColor=UIColor.red
            sender.tintColor=UIColor.red
            sender.isUserInteractionEnabled = false
            sender.setTitleColor(.red, for: .normal)
            lives=lives-1
            livescounter.text=String(lives)
        }
        
        if(lives<=0){
            resetgame()
        }
        let _url = Bundle.main.url(forResource: "sounds/ding", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: _url!)
        player.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(rand)
        // Do any additional setup after loading the view.
    }
    func resetgame(){
        rand=Int.random(in: 1...25)
        lives=5
        livescounter.text=String(lives)
        for allbutton in arrButton{
            allbutton.backgroundColor=UIColor.white
            allbutton.tintColor=UIColor.white
            allbutton.isUserInteractionEnabled=true;
        }
    }
}
