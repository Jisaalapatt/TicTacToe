//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jisa Gigi on 3/16/21.
//

import UIKit

class PlayViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameisActive = true
    var done = 0
    
    var name1 : String! = nil
    var name2 : String! = nil
    
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var labelWon: UILabel!
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgain.isHidden = true
        // Do any additional setup after loading the view.
    }
    func hide(){
        labelWon.isHidden = true
        playAgain.isHidden = true
        gameisActive = true
        labelWon.text = ""

    }
    func show(){
        labelWon.isHidden = false
        playAgain.isHidden = false
        gameisActive = false
    }
    @IBAction func PlayAgain(_ sender: UIButton) {
        hide()
        gameState = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1 //Cross
        done = 0
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
        }
        
    }
    
    @IBAction func Pressed(_ sender: UIButton) {
        // print(sender.tag)

        if (gameState[sender.tag-1] == 0 && gameisActive == true) {
            gameState[sender.tag-1] = activePlayer
            
            if(activePlayer == 1){
                sender.setImage(UIImage(named: "Cross1.png"), for: .normal)
                activePlayer = 2
            }else{
                sender.setImage(UIImage(named: "Not.png"), for: .normal)
                activePlayer = 1
            }
        }
        // for i in 0...8 {  print(gameState[i]) }
        for combinaion in winningCombinations {

            
            if gameState[combinaion[0]] != 0 && gameState[combinaion[0]] == gameState[combinaion[1]] && gameState[combinaion[1]] == gameState[combinaion[2]]{
                //  print("  \(gameState[combinaion[0]]) \(gameState[combinaion[1]]) \(gameState[combinaion[2]])")
                gameisActive = false
                done = 1
                if gameState[combinaion[0]] == 1{
                    labelWon.text = "\(name1!) Won"
                    
                }
                else{
                    labelWon.text = "\(name2!)  Won"
                }
                show()
                
                
            }
        }
        gameisActive = false
        for i in gameState {
           if i == 0
           {
                gameisActive = true
                break;
           }
            
            
        }
        if gameisActive == false && done == 0{
            labelWon.text = "Draw"
            show()
        }
            
        if done == 1 {
            gameState = [3,4,5,6,7,8,9,10,11]
        }
    }//func
    
    @IBAction func PlayAgainOneMore(_ sender: UIButton) {
    

  let MCtrl = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController


self.navigationController?.pushViewController(MCtrl, animated: true)
}
    
}//class

