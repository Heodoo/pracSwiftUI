//
//  AppDelegate.swift
//  HelloMacSwift
//
//  Created by 허두영 on 2022/10/13.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!

    @IBOutlet weak var myInputTextFieldCell: NSTextFieldCell!
    
    @IBOutlet weak var myLabelTextFieldCell: NSTextFieldCell!
    
    @IBAction func pressBtnSayHello(_ sender: Any) {
        var myString : String = self.myInputTextFieldCell.title
        self.myLabelTextFieldCell.title = myString
        
        let mySn: NSSpeechSynthesizer = NSSpeechSynthesizer()
        mySn.startSpeaking(myString)
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

