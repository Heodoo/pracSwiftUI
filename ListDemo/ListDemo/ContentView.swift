//
//  ContentView.swift
//  ListDemo
//
//  Created by 허두영 on 2022/10/25.
//

import SwiftUI

//리스트나 ForEach에 데이터를 넘겨줘서 사용할때는 Identifiable 프로토콜을 따라야함
struct ToDoItem : Identifiable {
    //id는 Idenfiable 을 따르면 필요한 프로퍼티
    // UUID = 유저의 기기 일련번호에 관련되어 얻는 유니크한 랜덤 넘버?
    var id = UUID()
    
    var task: String
    var imageName: String
    
}

var listData: [ToDoItem] = [
    ToDoItem(task: "Wash the car", imageName: "car.fill"),
    ToDoItem(task: "Vacuum house", imageName: "house.fill"),
    ToDoItem(task: "Pick up the phone", imageName: "phone.fill"),
    ToDoItem(task: "Auction the kids on ebay", imageName: "cart.fill"),
    ToDoItem(task: "Order Pizza for dinner", imageName: "fork.knife")
]

struct ContentView: View {
    @State private var toggleStatus = true
    var body: some View {
//        List(listData) { item in
//            VStack{
//                Image(systemName: item.imageName)
//                Text(item.task)
//                //Text("\(item.id)")
//            }
//
//        }
//        .listStyle(.plain)
        
        //리스트+ 내비게이션 뷰를 통해 리스트 아이템을 선택해서 다른 뷰로
        // 이동하는 기능을 만들 수 있다.
        NavigationView{
            List{
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notification")
                    }
                }
                Section(header: Text("To Do Tasks")){
                    ForEach(listData) { item in
                        NavigationLink(destination:{
                            Text(item.task)
                        }){
                            HStack{
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    //화면 상에 작업만 해줌 (실제 데이터는 앱이 가지고 있게됨
                    //따라서 함수에서 따로 데이터를 삭제시키는 작업이 필요)
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            .listStyle(.automatic)
            .navigationTitle(Text("To Do List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}
//.onDelete로 화면상에서는 지웠지만 함수에서 실제 데이터를 삭제시키는 작업이 필요
func deleteItem(at offset: IndexSet) {
    print("indexSet: \(offset)")
    print(listData)
}

//.onMove로 화면상에서는 데이터를 이동했지만 함수에서 실제 데이터의 위치를 move 하는 작업이 필요
func moveItem(from source: IndexSet, to destination: Int){
    print("source: \(source)")
    print("destination: \(destination)")
    print(listData)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
