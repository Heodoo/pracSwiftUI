//
//  ViewController.swift
//  EazyCalculator
//
//  Created by 허두영 on 2022/10/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let syntherzier: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressCalcButton(_ sender: Any) {
        let myString: String = myTextField.text ?? "0"
        let myNumber: Int = Int(myString) ?? 0
        
        print("\(myNumber)")
        let result: Int = myNumber*myNumber
        let resultString : String = "결과: \(result)"
        myLabel.text = resultString
        syntherzier.speak(AVSpeechUtterance(string: resultString + " 입니다."))
        
    }
    

}

