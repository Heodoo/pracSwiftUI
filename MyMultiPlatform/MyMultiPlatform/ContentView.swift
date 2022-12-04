//
//  ContentView.swift
//  MyMultiPlatform
//
//  Created by MacBook on 2022/11/30.
//multiplatform맥 아이패드 아이폰 까지 다양한 플랫폼을 swiftUI로 한번에 개발가능

import SwiftUI

struct ContentView: View {
    @State private var selectedMenuItemID: MenuItem.ID?
    @State private var selectedSchoolItemID: SchoolItem.ID?
    var body: some View {
        NavigationSplitView {
            // 메뉴 바
            List(menuItems,selection: $selectedMenuItemID){ menuItem in
                Text(menuItem.name)
            }
        } content: {
            // 서브 메뉴
            List(schoolItems,selection: $selectedSchoolItemID) { schoolItem in
                Text(schoolItem.name)
            }
        } detail: {
            // 서브 메뉴에서 선택된 세부 콘텐츠
            SchoolDetailView(schoolID: selectedSchoolItemID)
        }

    }
}

struct SchoolDetailView : View {
    let schoolID: SchoolItem.ID?
    
    var schooolItem: SchoolItem? {
        get {
            for tempSchoolItem in schoolItems {
                if tempSchoolItem.id == schoolID {
                    return tempSchoolItem
                }
            }
            return nil
        }
    }
    
    var body: some View {
        VStack{
            Text(schooolItem?.description ?? "")
        }
        .navigationTitle(schooolItem?.name ?? "")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone 14 Pro", "iPad Pro (12.9-inch) (6th generation", "Any Mac (Apple Silcon, Intel)"],id:\.self){ device in
            ContentView().previewDevice(PreviewDevice(rawValue: device))
        }
    }
}
