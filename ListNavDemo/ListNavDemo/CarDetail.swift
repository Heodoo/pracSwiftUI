//
//  CarDetail.swift
//  ListNavDemo
//
//  Created by 허두영 on 2022/10/25.
//

import SwiftUI

struct CarDetail: View {
    let selectedCar: Car
    var body: some View {
        Form {
            Section(header: Text("Car Details")){
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(selectedCar.name)
                    .font(.headline)
                Text(selectedCar.description)
                    .font(.body)
                HStack{
                    Text("Hybrid")
                        .font(.headline)
                        Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
                
                
                
            }
        }
        
        
        
    }
}
