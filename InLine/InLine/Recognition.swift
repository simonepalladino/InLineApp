//
//  Recognition.swift
//  InLine
//
//  Created by simone on 27/06/23.
//

import SwiftUI
import UIKit

struct Recognition: View {
    
    @State var confidence: Double = 0.0
    @State var label: String = ""
    
    
    var body: some View {
        ZStack {
            Image("sfondo")
            VStack {
                Image("logorotondo1")
                    .resizable()
                    .clipShape(Circle())
                    .offset(x: 0, y: -210)
                    .frame(width: 100, height: 100)
                
                Text("Ready to Play? Press the Button below!")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: MyCustomBackButton())
                    .offset(x: 0, y: -160)
                
                Text("Have Fun!")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                    .offset(x: 0, y: -150)
                
                NavigationLink(destination: CameraView()
                ){
                        Rectangle()
                            .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                            .cornerRadius(10)
                            .frame(width: 250, height: 60)
                            .overlay(Text("Recognize the ball"))
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(Color(red: 208/255, green: 211/255, blue: 217/255))
                                .padding()
                    }
            }
                
                Spacer()
            }
        }
    }

struct Recognition_Previews: PreviewProvider {
    static var previews: some View {
        Recognition()
    }
}

