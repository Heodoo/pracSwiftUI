//1. json에도 null이 있다.
//2. struct 내에서 정의해준 프로퍼티가 json에 (key, value)로 존재하지 않는 경우에 에러가 발생한다.
// -> "keyNotFound(CodingKeys ~~~ " 에러가 발생
// -> 프로퍼티를 옵셔널 처리해주면 해결 가능
//3. 반대로 json에 있는 (key, value)를 struct 내에서 정의해주지 않아도 에러는 발생하지 않는다.
//제이슨에서 null로 올 수 있는 것들에 Optional타입으로 만들면 디코딩시 null값이 올 때 해당 변수에 nil로 값이 들어가게 됩니다


import Foundation

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct WorldCup: Codable {
    var name: String
    var rounds: [Round]
}

struct Round: Codable {
    var name: String
    var matches: [MatchItem]
}

struct MatchItem: Codable {
    var num: Int
    var date: String
    var time: String
    var team1: Team
    var team2: Team
    var score1: Int
    var score2: Int
    var score1i: Int
    var score2i: Int
    var goals1: [Goal]?
    var goals2: [Goal]?
    var group: String?
    var stadium: Stadium
    var city: String
    var timezone: String
}

struct Team: Codable {
    var name: String
    var code: String
}

struct Goal: Codable {
    var name: String
    var minute: Int
    var score1: Int
    var score2: Int
    var penalty: Bool?
    var owngoal: Bool?
    var offset: Int?
}

struct Stadium: Codable {
    var key: String
    var name: String
}



func loadJson<T: Decodable>(data: Data) -> T {
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse data: \(error)")
    }
}

let url = URL(string: "https://raw.githubusercontent.com/openfootball/worldcup.json/master/2018/worldcup.json")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing by error")
        return
    }
    
    var worldCupData: WorldCup = loadJson(data: data)
    
    worldCupData.rounds.forEach { round in
        round.matches.forEach { match in
            print("(\(match.team1.name)) \(match.score1) : \(match.score2) (\(match.team2.name))")
            print("-------------")
        }
    }
}

task.resume()

/*
 struct Lecture: Codable {
     var pagination: Pagination
     var results: [Results]
     
 }

 struct Pagination: Codable {
     var count: Int
     var previous: String?
     var num_pages: Int
     var next: String
 }

 struct Results: Codable {
     var blocks_url: String
     var effort: String
     var end: String
     var enrollment_start: String
     var enrollment_end: String
     var id: String
 }


 func loadJson<T: Decodable>(data: Data) -> T {
     do {
         return try JSONDecoder().decode(T.self, from: data)
     } catch {
         fatalError("Unable to parse data: \(error)")
     }
 }

 let url = URL(string: "https://apis.data.go.kr/B552881/kmooc/courseList?serviceKey=DlsG82zYpBjL3dL6XB52XaI9n%2FLX37nb5v%2BjUrn9IxLT%2Fe78qeC6ChO9heFQeJwv%2BpclYR8ux0Q4e1stnKHE2Q%3D%3D&Page=1&Org=FUNMOOC&Mobile=1")!

 let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
     // data, response, error을 활용한 데이터 가져온 이후의 작업
     
     // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
     guard let data else {
         print("nothing by error")
         return
     }
     
     var lectureData: Lecture = loadJson(data: data)
     print(lectureData)
     
     
 }

 task.resume()

 */
