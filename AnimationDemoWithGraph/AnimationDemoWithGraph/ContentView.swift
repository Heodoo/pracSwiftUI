//
//  ContentView.swift
//  AnimationDemoWithGraph
//
//  Created by 허두영 on 2022/10/31.
//

import SwiftUI
let colors =  [Color.red, Color.yellow,
               Color.green, Color.blue, Color.purple]

func generateRandomArray(size: Int, in range:Range<Int>)->[Int] {
    var result = [Int]()
    for _ in 0..<size {
        result.append(Int.random(in: range))
    }
    return result
}

var arr1 = generateRandomArray(size: 5,in:1..<10)
var arr2 = generateRandomArray(size: 5,in:1..<100)
var arr3 = generateRandomArray(size: 5,in:20..<70)


struct ContentView: View {
    @State private var section = 0
    @State private var points: [[Int]] = [arr1,arr2,arr3]
    var body: some View {
        VStack {
            HStack{
                ForEach(0..<3, id: \.self) { i in
                    Button(action: {
                        //points[i] = generateRandomArray(size: 5, in: 1..<100)
                        withAnimation(.linear(duration: 1)){
                            section = i+1
                        }}) {
                        Text("배열 \(i+1)")
                    }
                    
                }
            }
            .font(.title)
            .padding()
            
            Spacer()
            if section == 1 {
                BarChart(points: $points[0])
            }else if section == 2{
                BarChart(points: $points[1])
            }else if section == 3{
                BarChart(points: $points[2])
            }
            
            
            
        }
        .padding()
    }
}

struct Bar : Shape {
    let point:Int
    func path(in rect: CGRect) -> Path {
        let xCor = 300 / (5.0 + 0.0)
        let yCor = 400 / (100.0 + 0.0)
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .zero)
        
        //        points.indices.forEach { idx in
        //            let bar = CGRect(
        //                x: xCor * CGFloat(idx),
        //                y: 0,
        //                width: xCor,
        //                height: yCor * CGFloat(points[idx]))
        //                .applying(.init(translationX: 0, y: height - yCor * CGFloat(points[idx])))
        //            path.addRect(bar)
        //        }
        let bar = CGRect(
            x: 0,
            y: 0,
            width: xCor - 10,
            height: yCor * CGFloat(point))
            .applying(.init(translationX: 0, y: height - yCor * CGFloat(point)))
        path.addRect(bar)
        return path
    }
}
struct BarChart : View {
    @Binding var points : [Int]
    var body: some View {
        HStack(){
            ForEach(0..<5, id: \.self) { idx in
                Bar(point: points[idx])
                    .fill(colors[idx])
            }
        }
        //.animation(.linear(duration: 5), value: points)
        .padding()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
