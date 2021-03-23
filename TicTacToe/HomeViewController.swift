//
//  HomeViewController.swift
//  TicTacToe
//
//  Created by Jisa Gigi on 3/22/21.
//

import Foundation
import UIKit
class HomeViewController: UIViewController {

    @IBOutlet weak var Txt1: UITextField!
    @IBOutlet weak var Txt2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func PressedGo(_ sender: UIButton) {
        let NCtrl = storyboard?.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController
       // let NCtrl = storyboard?.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController
        if(Txt1.text == ""){
            NCtrl.name1 = "Player 1"
        }else{
            NCtrl.name1 = Txt1.text
        }
        if(Txt2.text == ""){
            NCtrl.name2 = "Player2"
        }else{
            NCtrl.name2 = Txt2.text
        }

   //    print("Link : ", MCtrl.fUrl!)

       self.navigationController?.pushViewController(NCtrl, animated: true)
    }
    
   
}

