//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by 허두영 on 2022/10/25.
//

import SwiftUI

struct AddNewCar: View {
    @ObservedObject var carStore: CarStore
    
    
    //한 뷰에 대한 간단한 바인딩이 필요할 때 State를 써서 뷰를 다시 그리면 편할듯?
    @State var isHybrid = false
    @State var name: String = ""
    @State var description: String = ""
    
    
    var body: some View {
        // 뷰들을 그룹핑하고 서로 다른 세션으로 나눌 수 있게 하는 컨테이너 뷰이다.
        Form{
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }
                .padding()
                
            }
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        
        carStore.cars.append(newCar)
    }

    
}


struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
