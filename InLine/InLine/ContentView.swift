//
//  ContentView.swift
//  InLine
//
//  Created by simone on 26/06/23.
//
import SwiftUI
import CoreML


struct ContentView: View {
    @StateObject var counter = Counter()
    var body: some View {
        
        NavigationView {
            ZStack{
                Image("sfondo")
                VStack {
                    Image("logorotondo1")
                        .resizable()
                        .clipShape(Circle())
                        .offset(x: 0, y:-170)
                        .frame(width: 100, height: 100)
                    
                    Text("! Welcome on inLine !")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                        .offset(x: 0, y: -160)
                    
                    NavigationLink(destination: Recognition()) {
                        Rectangle()
                            .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                            .frame(width: 220, height: 50)
                            .cornerRadius(20)
                            .overlay(Text("Start Game")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .foregroundColor(Color(red: 208/255, green: 211/255, blue: 217/255))
                                .multilineTextAlignment(.leading)
                                .shadow(radius: 33)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                                     
                            ).offset(x: 0, y:-10)
                    }
                    NavigationLink(destination: StartGameView()) {
                        Rectangle()
                            .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                            .frame(width: 220, height: 50)
                            .cornerRadius(20)
                            .overlay(Text("Help")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .foregroundColor(Color(red: 208/255, green: 211/255, blue: 217/255))
                                .multilineTextAlignment(.leading)
                                .shadow(radius: 33)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                            ).offset(x: 0, y:12)
                    }
                    /*
                    HStack {
                        Button(action:{
                            if(counter.booleano == false){
                                counter.statogoltrue()
                            }
                        }) {
                                Rectangle()
                                    .fill(Color(red: 0,green: 0, blue: 255))
                                    .frame(width: 220, height: 50)
                                    .cornerRadius(20)
                                    .overlay(Text("gol(test)")
                                        .font(.system(size: 25, weight: .bold, design: .rounded))
                                        .multilineTextAlignment(.leading)
                                        .shadow(radius: 33)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .padding()
                                    ).offset(x: 0, y:12)
                            }
                            .padding()
                        }
                    */
                    
                }
            }
        }
    }
}


struct MyCustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            // Aggiungi altre azioni se necessario
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
                .font(.title2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

