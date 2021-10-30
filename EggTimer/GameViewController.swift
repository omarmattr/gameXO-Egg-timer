//
//  GameViewController.swift
//  EggTimer
//
//  Created by omarmattr on 28/10/2021.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet var btn1:UIButton!
    @IBOutlet var btn2:UIButton!
    @IBOutlet var btn3:UIButton!
    @IBOutlet var btn4:UIButton!
    @IBOutlet var btn5:UIButton!
    @IBOutlet var btn6:UIButton!
    @IBOutlet var btn7:UIButton!
    @IBOutlet var btn8:UIButton!
    @IBOutlet var btn9:UIButton!
    private var btnArray : [UIButton]!
    private var player = 1
    private var array = [0,0,0,
                         0,0,0,
                         0,0,0]
    @IBAction func onClick(_ sender:UIButton){
        array[sender.tag] = player
        selcte(btn: sender)
        print(array)
        game(player: 1)
        game(player: 2)
      
    }
    func game(player:Int){
        if
            (array[0] == player &&  array[1] == player && array[2] == player ) ||
            (array[3] == player &&  array[4] == player && array[5] == player ) ||
            (array[6] == player &&  array[7] == player && array[8] == player ) ||
            (array[0] == player &&  array[3] == player && array[6] == player ) ||
            (array[1] == player &&  array[4] == player && array[7] == player ) ||
            (array[2] == player &&  array[5] == player && array[8] == player ) ||
            (array[0] == player &&  array[4] == player && array[8] == player ) ||
            (array[2] == player &&  array[4] == player && array[6] == player)
            {
        
            resetGame(player: player)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        btnArray = [btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9]
        
        
        // Do any additional setup after loading the view.
    }
    func selcte(btn:UIButton) {
        if btn.image(for: .normal) == nil {
            if player == 1 {
                btn.setImage(#imageLiteral(resourceName: "x"), for: .normal)
                player = 2
            }else {
                btn.setImage(#imageLiteral(resourceName: "o"), for: .normal)
                player = 1
            }
        }
       
    }
    func resetGame(player:Int){
        DispatchQueue.main.async {
           Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            for b in self.btnArray{
                b.setImage(nil, for: .normal)
            }
           
            self.array = [0,0,0,
                     0,0,0,
                    0,0,0]
            self.player = player
            print(player)
              }
    
     
        
        }
        
    }
    



}
