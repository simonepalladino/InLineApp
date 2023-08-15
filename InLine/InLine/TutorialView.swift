//
//  TutorialView.swift
//  inline_ios
//
//  Created by francesco on 23/06/23.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        pageControl.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

struct TutorialView: View {
    let tutorialImages: [String] = ["1", "2", "3"]
    @State private var currentPage = 0
    @State private var value: CGFloat = 1
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -1100) {
                        ForEach(tutorialImages, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaleEffect(0.4)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width)
                                .clipped()
                                .offset(x: 0, y: 80)
                        }
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                
            }
        }
    }
}
