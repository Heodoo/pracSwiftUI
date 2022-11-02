import SwiftUI

// SwiftUI 에서 UIKit 기능을 추가할때는 UIViewRepresentable 프로토콜을 따라야한다.
struct MyScrollView : UIViewRepresentable {
    var text : String
    // UIView 기반 컴포넌트의 인스턴스를 생성하고 필요한 초기화 작업을 수행한 뒤 반환하는 역활을 한다
    func makeUIView(context: UIViewRepresentableContext<MyScrollView>) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleRefresh), for: .valueChanged)
        let myLabel = UILabel(frame:CGRect(x:0,y:0,width:300,height:50))
        myLabel.text = text
        scrollView.addSubview(myLabel)
        
        return scrollView
    }
    
    //UIView 자체를 업데이트 해야하는 변경이 SwiftUI 뷰에서 생길 떄마다 호출된다
    func updateUIView(_ uiView: UIScrollView, context: UIViewRepresentableContext<MyScrollView>) {
        //필요한 작업을 수행한다
        
    }
    
    //정적기능을 하는 컴포넌트와 달리 이벤트를 발생시키는 컴포넌트는 코디네이터를 추가해야한다
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
   
    class Coordinator: NSObject, UIScrollViewDelegate {
        var control: MyScrollView

        init(_ control: MyScrollView){
            self.control = control
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            print("View is Scrolling")
        }
        @objc func handleRefresh(sender: UIRefreshControl){
            sender.endRefreshing()
        }
        
        
    }
    
    
}



