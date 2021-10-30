//
//  ViewController.swift
//  EggTimer
//
//  Created by omarmattr on 27/10/2021.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var player: AVAudioPlayer?
    private var time = 5
    var counter = 0
    private var timer:Timer? = nil
    @IBOutlet weak var eggImage:UIImageView!
    @IBAction func playBtn(_ sender : UIButton){
        schedule()
    }
    @IBAction func typeBtn(_ sender : UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0 :eggImage.image = #imageLiteral(resourceName: "soft_egg")
            time = 5
        case 1 :eggImage.image = #imageLiteral(resourceName: "medium_egg")
            time = 10
        case 2 :eggImage.image = #imageLiteral(resourceName: "hard_egg")
            time = 15
          
        default:eggImage.image = UIImage(named: "hard_egg")
        }
        eggProgress.progress = 0
        counter = 0
        if let _ = player  {
            player!.stop()
        }
        
    }
    @IBOutlet weak var eggProgress:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        // Do any additional setup after loading the view.
    }

    func schedule() {
        if let _ = player  {
            player!.stop()
        }
        eggProgress.progress = 0
        counter = 0
        DispatchQueue.main.async {
            if self.timer == nil{
            self.timer =   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
            }
            }
      }
    @objc func updateCounter() {
        //example functionality
        if counter < time {
            print("\(counter) seconds to the end of the world")
            counter += 1
            eggProgress.progress = Float(counter)/Float(time)
        }else {
            playSound()
            timer!.invalidate()
            timer = nil
        }
    }
  

    func playSound() {
        let url = Bundle.main.url(forResource: "sound", withExtension: "wav")!

        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()

        } catch let error as NSError {
            print(error.description)
        }
    }
    
}

