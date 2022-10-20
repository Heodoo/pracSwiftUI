import SwiftUI


struct ContentView: View {
    
    let resultList : [String] = ["Down","Up","Correct!",""]
    
    @State private var inputNumber : String = ""
    @State private var answerNumber = Int.random(in: 1...10) // 랜덤 정답
    @State private var compareResult : Int = 3
    @State private var tryCounter : Int = 0
    
    var resultString : String = ""
    
    var body: some View {
        VStack {
            Text("Guess the Number!")
                .font(.largeTitle)
            
            Spacer()
            
            Text(inputNumber)
                .font(.largeTitle)
            
            Spacer()
            Divider()
            
            
            Text(" \(resultList[compareResult])")
            
            Text("\(tryCounter) / 3")
            
            Spacer()
            Divider()
            
            NumpadView (
            numViewInputNumber: $inputNumber,
            numViewAnswerNumber: $answerNumber,
            numViewIsCorrect: $compareResult,
            numViewTryCounter: $tryCounter
            )
        }
        .padding()
    }
}

struct NumpadView: View {
    
    @Binding var numViewInputNumber : String
    @Binding var numViewAnswerNumber : Int
    @Binding var numViewIsCorrect : Int
    @Binding var numViewTryCounter : Int
    
    
    var body: some View {
        VStack {
            HStack {
                
//                ForEach(1..<4,id: \.self) {
//                    Button(action : {
//                        self.numViewAnswerNumber += String($0)
//                    }) {
//                        Text(String($0))
//                            .modifier(buttonLayout())
//                    }
//                }
                
                
                
                
                Button(action: {
                    self.numViewInputNumber += "1"
                }) {
                    Text("1")
                        .modifier(buttonLayout())
                }
                Spacer()
                Button(action: {
                    self.numViewInputNumber += "2"
                }) {
                    Text("2")
                        .modifier(buttonLayout())
                }
                Spacer()
                Button(action: {
                    self.numViewInputNumber += "3"
                }) {
                    Text("3")
                        .modifier(buttonLayout())
                }
                
            }

            HStack {
                Button(action: {
                    self.numViewInputNumber += "4"
                }) {
                    Text("4")
                        .modifier(buttonLayout())
                }
                Spacer()
                Button(action: {
                    self.numViewInputNumber += "5"
                }) {
                    Text("5")
                        .modifier(buttonLayout())
                }
                Spacer()
                Button(action: {
                    self.numViewInputNumber += "6"
                }) {
                    Text("6")
                        .modifier(buttonLayout())
                }
            }

            HStack {
                Button(action: {
                    self.numViewInputNumber += "7"
                }) {
                    Text("7")
                        .modifier(buttonLayout())
                }
                Spacer()
                Button(action: {
                    self.numViewInputNumber += "8"
                }) {
                    Text("8")
                        .modifier(buttonLayout())
                }
                Spacer()
                Button(action: {
                    self.numViewInputNumber += "9"
                }) {
                    Text("9")
                        .modifier(buttonLayout())
                }
            }

            HStack {
                Button(action: {
                    guard numViewInputNumber.isEmpty else {
                        self.numViewInputNumber.removeLast()
                        return
                    }
                }) {
                    Text("<")
                        .modifier(buttonLayout())
                }
                Spacer()
                Button(action: {
                    self.numViewInputNumber += "0"
                }) {
                    Text("0")
                        .modifier(buttonLayout())
                }
                Spacer()
                Button(action: {
                    let numA = Int(numViewInputNumber)!
                    let numB = numViewAnswerNumber
                    
                    if numA > numB {
                        numViewIsCorrect = 0
                    } else if numA < numB {
                        numViewIsCorrect = 1
                    } else {
                        numViewIsCorrect = 2
                    }
                    
                    numViewTryCounter += 1
                    
                }) {
                    Text("↵")
                        .modifier(buttonLayout())
                }
            }
        }
        .border(.black)
    }
}

struct buttonLayout : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.orange)
            .padding(10)
            .frame(width: 100, height: 100)
            .background(Color.gray)
            .clipShape(Circle())
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
