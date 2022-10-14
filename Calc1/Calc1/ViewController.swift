//
//  ViewController.swift
//  Calc1
//
//  Created by 허두영 on 2022/10/14.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    
    @IBOutlet weak var insertNumberLabel: UILabel!
    
    
    
    @IBAction func touchButton(_ sender : UIButton){
        guard let inputText = sender.titleLabel?.text
        else{ return }
        print(inputText)
        var inputNumber = Int(inputText) ?? 0
        number = 10*number + inputNumber
        insertNumberLabel.text = "\(number)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

