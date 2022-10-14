//
//  ViewController.swift
//  MyCalculator
//
//  Created by 허두영 on 2022/10/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let synthersizer = AVSpeechSynthesizer()

    @IBOutlet weak var aTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    //btn
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var subBtn: UIButton!
    @IBOutlet weak var mulBtn: UIButton!
    @IBOutlet weak var divBtn: UIButton!
    
    var resultNumber: Int = 0
    var numberA : Int = 0
    var numberB : Int = 0
    
    
    @IBAction func addButton(_ sender: Any) {
        self.setNumber()
        resultNumber = numberA + numberB
        resultLabel.text = "결과: \(resultNumber)"
        self.mySpeak(to: resultNumber)
        
    }
    @IBAction func subButton(_ sender: Any) {
        self.setNumber()
        resultNumber = numberA - numberB
        resultLabel.text = "결과: \(resultNumber)"
        self.mySpeak(to: resultNumber)
    }
    
    @IBAction func mulButton(_ sender: Any) {
        self.setNumber()
        resultNumber = numberA * numberB
        resultLabel.text = "결과: \(resultNumber)"
        self.mySpeak(to: resultNumber)
    }
    
    @IBAction func divButton(_ sender: Any) {
        setNumber()
        resultNumber = numberA / numberB
        resultLabel.text = "결과: \(resultNumber)"
        mySpeak(to: resultNumber)
    }
    
    func setNumber(){
        numberA = Int(aTextField.text ?? "0") ?? 0
        numberB = Int(bTextField.text ?? "0") ?? 0
        
    }
    
    func mySpeak(to resultInt: Int ){
        let resultString = "결과는 \(resultInt) 입니다."
        synthersizer.speak(AVSpeechUtterance(string: resultString))
    }
    
//    func calcButtonState(){
//        addBtn.isEnabled = true
//        addBtn.backgroundColor = UIColor.blue
//        var flag: Int = 0
//        if aTextField.text == "" || aTextField.text == nil ||  bTextField.text == "" || aTextField.text == nil {
//            flag += 1
//        }
//
//        if flag == 1 {
//            isHiddenBtn()
//        }
//
//
//    }
//
//    func isHiddenBtn() {
//        addBtn.isEnabled = false
//        addBtn.backgroundColor = UIColor.red
//    }
    
    @objc func textFieldDidChange() {
            if let hasA = aTextField.text, let hasB = bTextField.text {
                if hasA != "" && hasB != "" {
                    addBtn.isEnabled = true
                    addBtn.backgroundColor = .systemBlue
                }
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        aTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        bTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        addBtn.isEnabled = false
        addBtn.backgroundColor = .gray
    }

    
    

}

