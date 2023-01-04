//
//  ContentView.swift
//  PaintTest
//
//  Created by MacBook on 2023/01/05.
//

import SwiftUI

/* -MARK: 그리기 로직
    클릭하고 움직였을때 변화를 감지하는데 두 점마다 Line을 하나 만듬(currentLine)
    곡선형으로 계속 움직이므로 미세한 시간마다 두점을 currentLine에 저장함
    currentLine에 선택한 색깔과 두께 적용
    생성된 하나의 currentLine을 Line배열에 append
    클릭을 뗄때까지 Line 배열에 변화를 감지한 currentLine을 계속 추가함
    뷰에서 선을 그릴때마다 이과정을 반복
    이렇게 생성된 Line배열의 배열인 LineSet을 통해
    Canvas에서 다시 그려줌
*/

struct Line {
    var points : [CGPoint] = []
    var color : Color = .black
    var lineWidth : Double = 5.0
}

struct ContentView: View {
    @State var currentLine : Line = Line()
    @State var lineSets : [[Line]] = [[]]
    @State var thickness : Double = 5
    @State var selectedColor : Color = .black
    var body: some View {
        VStack{
            VStack{
                Canvas { context, size in
                    for lineSet in lineSets {
                        for line in lineSet {
                            print("line: \(line)")
                            var path = Path()
                            path.addLines(line.points)
                            context.stroke(path, with: .color(line.color), style: .init(lineWidth: line.lineWidth))
                        }
                    }
                    
                }.gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged({ value in
                            let newPoint = value.location
                            currentLine.lineWidth = thickness
                            currentLine.points.append(newPoint)
                            self.lineSets[lineSets.endIndex-1].append(currentLine)
                        })
                        .onEnded({ value in
                            self.currentLine = Line(points: [],color: selectedColor)
                            self.lineSets.append([])
                            print(lineSets.count)
                        })
                )
                
            }.frame(width:350,height: 350)
                .border(.black)
            //최근 그린 선 삭제
            Button(action: {
                // lineSets는 마지막에 항상 [] 빈배열을 가지고 있음
                // 따라서 마지막 바로 전 인덱스에 접근하여 최근 값을 지워야함
                // removelast O(1) remove O(n)
                // 라스트를 두번지우고 라스트에 빈배열 추가하는게 속도가 더 빠를듯
                if lineSets.count > 1 {
                    let lastIndex = lineSets.endIndex
                    lineSets.remove(at: lastIndex-2)
                }
            }) {
                Text("하나취소")
            }
            
            Slider(value: $thickness, in: 1...20) {
                Text("Thickness")
            }.frame(width: 300)
                .onChange(of: thickness, perform: { newThickness in
                    currentLine.lineWidth = newThickness
                })
            Divider()
            ColorPicker(selection: $selectedColor) {
                Text("펜 색상 선택")
            }.onChange(of: selectedColor) { newValue in
                currentLine.color = newValue
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView()
    }
}
