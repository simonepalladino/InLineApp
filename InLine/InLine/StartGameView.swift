//
//  StartGameView.swift
//  InLineApp
//
//  Created by mattia on 23/06/23.
//

import SwiftUI

struct StartGameView: View {
    var body: some View {
        ZStack{
            Image("sfondo")
            
            VStack{
                Spacer()
                Image("logorotondo1")
                    .resizable()
                    .clipShape(Circle())
                    .offset(x: 0, y: 210)
                    .frame(width: 100, height: 100)
                
                Text("Welcome on the Tutorial!")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: MyCustomBackButton())
                    .offset(x: 0, y: 230)
                
                Text("Swipe from right to left")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                    .offset(x: 0, y: 240)
                
                TutorialView()
                
            }.offset(x: 0, y: -50)
        }
    }
}



struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
