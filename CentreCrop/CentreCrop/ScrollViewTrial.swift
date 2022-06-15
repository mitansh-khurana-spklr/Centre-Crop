//
//  ScrollViewTrial.swift
//  CentreCrop
//
//  Created by Mitansh Khurana on 10/06/22.
//

import SwiftUI

struct ScrollViewTrial: View {
    var body: some View {
        
        
        VStack {
            
            Text("Title")
            
            UIScrollViewWrapper{
                Image("Mitansh Khurana")
                    .resizable()
                    
            }
            
            Text("Aspect Ratios")
        }
    }
}

struct ScrollViewTrial_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewTrial()
    }
}


struct UIScrollViewWrapper<Content: View>: UIViewControllerRepresentable {

    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    func makeUIViewController(context: Context) -> UIScrollViewViewController {
        let vc = UIScrollViewViewController()
        vc.hostingController.rootView = AnyView(self.content())
        return vc
    }

    func updateUIViewController(_ viewController: UIScrollViewViewController, context: Context) {
        viewController.hostingController.rootView = AnyView(self.content())
    }
}

class UIScrollViewViewController: UIViewController, UIScrollViewDelegate {

    lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.isPagingEnabled = true
        return v
    }()
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return nil
    }

    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.scrollView)
        self.pinEdges(of: self.scrollView, to: self.view)

        self.hostingController.willMove(toParent: self)
        self.scrollView.addSubview(self.hostingController.view)
        self.pinEdges(of: self.hostingController.view, to: self.scrollView)
        self.hostingController.didMove(toParent: self)
//
//        scrollView.delegate = self
//        scrollView.minimumZoomScale = 0.1
//        scrollView.maximumZoomScale = 4.0
//        scrollView.zoomScale = 1.0
        
//          let image = UIImage(named: "Mitansh Khurana")!
//          imageView = UIImageView(image: image)
//          imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size:image.size)
//          scrollView.addSubview(imageView)
//
//          // 2
//          scrollView.contentSize = image.size
//
//          // 3
//          var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
//          doubleTapRecognizer.numberOfTapsRequired = 2
//          doubleTapRecognizer.numberOfTouchesRequired = 1
//          scrollView.addGestureRecognizer(doubleTapRecognizer)
//
//          // 4
//          let scrollViewFrame = scrollView.frame
//          let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
//          let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
//          let minScale = min(scaleWidth, scaleHeight);
//          scrollView.minimumZoomScale = minScale;
//
//          // 5
//          scrollView.maximumZoomScale = 1.0
//          scrollView.zoomScale = minScale;
//
//          // 6
//          centerScrollViewContents()

    }

    func pinEdges(of viewA: UIView, to viewB: UIView) {
        viewA.translatesAutoresizingMaskIntoConstraints = false
        viewB.addConstraints([
            viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
            viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
            viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
            viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
        ])
    }

}
