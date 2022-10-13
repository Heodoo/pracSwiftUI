//
//  ViewController.swift
//  HelloPhone
//
//  Created by 허두영 on 2022/10/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myInputTextField: UITextField!
    @IBAction func pressSayHello(_ sender: Any) {
        let myString:String? = myInputTextField.text
        //if let 안쓰고 간단하게
        //let myString:String = myInputTextField.text ?? "no text"
        if let myString {
            print("\(myString)")
            myLabel.text = myString
            let utterance = AVSpeechUtterance(string: myString)
            utterance.rate = 0.4
            synthesizer.speak(utterance)
            
            
        }else{
            print("no text")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

