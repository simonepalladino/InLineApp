//
//  CameraView.swift
//  InLine
//
//  Created by mattia on 04/07/23.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        HostedViewController()
            .edgesIgnoringSafeArea(.top)
        
        Path() { path in
            path.move(to: CGPoint(x: 0, y: 20))
            path.addLine(to: CGPoint(x: 500, y: 20))
            path.addLine(to: CGPoint(x: 500, y: 50))
            path.addLine(to: CGPoint(x: 0, y: 50))
        }
        .fill(Color.white)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
