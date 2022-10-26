//
//  ContentView.swift
//  ListNavDemo
//
//  Created by 허두영 on 2022/10/25.
//

import SwiftUI



struct ContentView: View {
    //json데이터로 받아온 carData로 CarStore init?
    @ObservedObject var carStore : CarStore = CarStore(cars: carData)
    
    @State private var isAdded : Bool = false
    var body: some View {
        //ListCell 에 있는 네비게이셔링크가 동작하려면 네비게이션뷰로 감싸야한다
        NavigationView{
            List{
                ForEach(carStore.cars) { car in
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewCar(carStore: self.carStore),
                                                        isActive: $isAdded,
                                                            label: {
                Text("Add")
                    .foregroundColor(.blue)
            })
            ,trailing: EditButton())
        }
    }
    func deleteItems(at offset: IndexSet){
        carStore.cars.remove(atOffsets: offset)
    }
    func moveItems(from source: IndexSet,to destination: Int){
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
    
    
}
struct ListCell: View {
    var car: Car
    
    var body: some View {
        NavigationLink(destination: CarDetail(selectedCar: car)){
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100)
                Text(car.name)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
