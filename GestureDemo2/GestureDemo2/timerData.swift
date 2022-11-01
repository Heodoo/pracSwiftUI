import Foundation
import AVFoundation

let syntersizer = AVSpeechSynthesizer()

class TimerData: ObservableObject {
    @Published var counter: Int = 0
    var timer: Timer?
    @Published var isOn : Bool = false {
        willSet {
            if newValue == true{
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: newValue)
            }
            
        }
    }
    
    var history : [Int] = []
    
    
    @objc func timerDidFire() {
        if isOn {
            counter += 1
            if counter%10 == 0 {
                speech(String(counter) + "패스")
            }
            //timerCount += 1
        }else{
            fireTimer()
        }
    }
    
    func fireTimer() {
        //timerCount = 0
        if let timer {
            //타이머를 멈추는게 아니고 지우는것
            timer.invalidate()
        }
        isOn = false
    }
    
    func gameReset(){
        history.append(counter)
        if let timer = timer {
            timer.invalidate()
        }
        counter = 0
    }
    
    func speech(_ str: String){
        let utterance = AVSpeechUtterance(string: str)
        syntersizer.speak(utterance)
    }
}
