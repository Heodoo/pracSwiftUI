//탭카운터
//왼쪽 밀면 숫자 줄이기
//롱으로 누르면 자동증가 카운터 시작 멈춤
//다섯,열마디마다 민수가 읽어주기
//기록한 숫자들의 목록을 보여주는등의 완성된 앱이 되기 위한 추가적인 기능도 구현해보기

import SwiftUI

struct ContentView: View {
    //@State private var counter = 0
    @ObservedObject var timerData : TimerData = TimerData()
    @GestureState private var offset : CGSize = .zero
    var body: some View {
        let longPress = LongPressGesture(minimumDuration: 2.0)
            .onEnded { value in
                print("ended , value: \(value)")
                    timerData.isOn = !timerData.isOn
            }
        let drag = DragGesture()
            .updating($offset, body: { value, state, transaction in
                state = value.translation
            })
            .onEnded { value in
                if value.location.x < 30 {
                    timerData.counter -= 1
                }else if value.location.x > 50 {
                    timerData.counter += 1
                }
                print("value: \(value)")
            }
        
        return VStack {
            Text("\(timerData.counter)")
                .font(.largeTitle)
                .offset(offset)
                .frame(width: 100,height: 100)
                .border(.black,width: 1)
                .gesture(drag)
                .padding()
            HStack{
                Image(systemName: "hand.tap.fill")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .gesture(longPress)
                    .frame(width: 100,height: 90)
                    .padding()
                Button(action: {
                    timerData.gameReset()
                    
                }) {
                    Image(systemName:"arrow.clockwise")
                        .resizable()
                        .frame(width: 100,height:100)
                }
            }
            List{
                ForEach(timerData.history,id:\.self) { h in
                    Text("\(h)")
                }
            }
             
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
