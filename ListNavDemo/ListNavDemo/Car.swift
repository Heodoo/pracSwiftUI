//
//  Car.swift
//  ListNavDemo
//
//  Created by 허두영 on 2022/10/25.
//

import Foundation
//Json파일을 파싱할때 Codable 프로토콜을 따라야함
struct Car : Codable, Identifiable {
    var id: String// : UUID로 선언하면 에러 json 파일이 string으로 받아옴
    var name: String
    
    var description : String
    var isHybrid: Bool
    
    var imageName: String
}
