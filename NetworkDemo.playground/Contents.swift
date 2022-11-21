import Foundation

// playground에서 URLSession 통신하려면 다음의 코드가 필요하다
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// 1. carData.json 파일을 mocki.io에 올린다.
// 2. URLSession으로 데이터를 가져와 바로 출력이 가능한지 살펴본다
// 3. 차 이름들만 출력되도록 만들어본다
// 4. 목록 데이터들을 더 활용해서 차 이름과 설명, 하이브리드 여부를 print로 출력하도록 한다

struct Car : Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String

}

let url = URL(string: "https://mocki.io/v1/92b34382-2478-4e9a-bfac-9ad9f48d5cd5")!
URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let data else {
        print("nothing")
        print("\(error)")
        return
    }
    do {
        let decorder = JSONDecoder()
        var result = try decorder.decode([Car].self, from: data)
        //return try JSONDecoder().decode([].self, from: data1)
        print(result)
        for car in result {
            print("차 이름: \(car.name)")
        }
    }catch{
        fatalError("Unable to parse : \(error)")
    }
    
}.resume()


//방법 2
// .resume 밖에서 데이터를 처리하는 방법을 고민해보았지만
// 그방법들은 await, async 를 활용해야함
// 따라서 방법2는 내가 아는 방법으로는 처리하기 어려움.. 다른방법으로 하자 일단
//var carData: [Car] = loadJson("https://mocki.io/v1/92b34382-2478-4e9a-bfac-9ad9f48d5cd5")
//
//func loadJson<T: Decodable>(_ url: String) -> T {
//    var result : T
//    URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
//        guard let data else {
//            print("nothing")
//            print("\(error)")
//            return
//        }
//        do {
//            result = try JSONDecoder().decode(T.self, from: data)
//        }catch{
//            fatalError("Unable to parse : \(error)")
//        }
//    }.resume()
//    DispatchQueue{
//        return result
//    }
//}

//강사님 방법
//import Foundation
//
//// playground에서 URLSession 통신하려면 다음의 코드가 필요하다
//import PlaygroundSupport
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//// 1. carData.json 파일을 mocki.io에 올린다.
//// 2. URLSession으로 데이터를 가져와 바로 출력이 가능한지 살펴본다
//// 3. 차 이름들만 출력되도록 만들어본다
//// 4. 목록 데이터들을 더 활용해서 차 이름과 설명, 하이브리드 여부를 print로 출력하도록 한다
//
//struct Car : Codable, Identifiable {
//    var id: String
//    var name: String
//    var description: String
//    var isHybrid: Bool
//    var imageName: String
//}
//
//func loadJson<T: Decodable>(data: Data) -> T {
//    do {
//        return try JSONDecoder().decode(T.self, from: data)
//    } catch {
//        fatalError("Unable to parse data: \(error)")
//    }
//}
//
//let url = URL(string: "https://mocki.io/v1/c21cbc0e-9877-4cd3-9f00-2d5b909caa10")!
//
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    // data, response, error을 활용한 데이터 가져온 이후의 작업
//
//    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
//    guard let data else {
//        print("nothing by error")
//        return
//    }
//
//    var carData: [Car] = loadJson(data: data)
//
//    for car in carData {
//        print("\(car.name)")
//        print("\(car.description)")
//        if car.isHybrid {
//            print("It's Hybrid!")
//        }
//        print("-----------------")
//    }
//}
//
//task.resume()
