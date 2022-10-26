//
//  File.swift
//  ListNavDemo
//
//  Created by 허두영 on 2022/10/25.
//

import Combine
import SwiftUI

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []){
        self.cars = cars
    }
}
