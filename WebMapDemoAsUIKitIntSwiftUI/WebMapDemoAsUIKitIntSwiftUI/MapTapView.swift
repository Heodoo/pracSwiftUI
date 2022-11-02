//
//  MapTapView.swift
//  WebMapDemoAsUIKitIntSwiftUI
//
//  Created by 허두영 on 2022/11/02.
//

import SwiftUI
import MapKit

struct MapTapView: View {
    // latitude 위도 longitude 경도 <- 애플 맵에서 원하는 장소를 우클릭해서 좌표를 복사해올수 있음
    @State private var region : MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708),
        span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
    )
    
    var body: some View {
        NavigationStack{
            VStack{
                Map(coordinateRegion: $region,
                    annotationItems: pointsOfInterest) {
                    item in
                    MapMarker(coordinate: item.coordinate, tint: .purple)
                }
            }
            .navigationTitle("Map")
        }
    }
}
struct AnnotatedItem : Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    
    
}


var pointsOfInterest = [
    AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708)),
    AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
    AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428))
]

//struct MapTapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapTapView()
//    }
//}
