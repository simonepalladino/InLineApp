//
//  ContentView.swift
//  InLine Watch App
//
//  Created by simone on 26/06/23.
//

import SwiftUI
import HealthKit
     
struct ContentView: View {
    @State private var isRunning = false
    @State private var elapsedTime = 0.0
    @State private var zero = false
    @State private var endgame = false
    @StateObject var counter = Counter()
    var workoutSessionManager = WorkoutSessionManager()
    @State private var showAlert = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
 
    
    var formattedTime: String {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        let milliseconds = Int((elapsedTime * 10).truncatingRemainder(dividingBy: 10))
        return String(format: "%02d:%02d,%02d", minutes, seconds, milliseconds)
    }
    
    var body: some View {
            ZStack{
                GeometryReader{geometry in
                    Image("backgroundHomewatch")
                        .edgesIgnoringSafeArea(.all)
                        .offset(x: -100, y: 0)
                }
                ScrollView{
                    VStack {
                        HStack{
                        /*
                            Rectangle()
                                .fill(Color(red:0,green:0,blue:128))
                                .frame(width: 100, height: 30)
                                .cornerRadius(20)
                                .overlay(Text(String(format: "%@", counter.booleano.description))
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .padding()
                                         
                                ).offset(x: 1, y: 0)
                                */
                            Rectangle()
                                .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                                .frame(width: 100, height: 30)
                                .cornerRadius(20)
                                .overlay(Text("\(counter.count) - 0")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color(red: 208/255, green: 211/255, blue: 217/255))
                                    .cornerRadius(5)
                                    .padding()
                                         
                                ).offset(x: 1, y: 0)
                                .onAppear {
                                    let workoutSessionManager = WorkoutSessionManager()
                                    workoutSessionManager.startWorkoutSession()
                                }
                            
                            
                            Button(action: {
                                endgame.toggle()
                                if endgame {
                                    (counter.zero())
                                }
                            }){
                                Rectangle()
                                    .foregroundColor(Color(red: 40/255, green: 48/255, blue: 64/255))
                                    .frame(width: 60, height: 30)
                                    .cornerRadius(15)
                                    .overlay(Text(endgame ? "END" : "END"))
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundColor(Color(red: 208/255, green: 211/255, blue: 217/255))
                                        .padding()
                                        .frame(width: 70, height: 30)
                            }
                        }.offset(x: 3, y: 0)
                        HStack{
                            
                            Button(action: {
                                isRunning.toggle()
                            }) {
                                Text(isRunning ? "Stop" : "Start")
                                    .font(.system(size: 16, weight: .regular))
                                
                                    .padding()
                                
                                    .background(Color.green)
                                    .cornerRadius(15)
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                zero.toggle()
                                if zero {
                                    elapsedTime = 0.0
                                }
                            }) {
                                Text(isRunning ? "Zero" : "Zero")
                                
                                    .font(.system(size: 16, weight: .regular))
                                    .padding()
                                    .background(.gray)
                                    .cornerRadius(15)
                                    .foregroundColor(Color(red:105,green:105,blue:105))
                            }
                            
                        }
                        
                        Text(formattedTime)
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .padding()
                        //.background(Color.brown)
                            .cornerRadius(5)
                    }.onReceive(counter.boolsubject) { booleano in
                        if booleano {
                            showAlert = true
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("! Goal Alert !"), message: Text("Do you want to confirm the goal? "), primaryButton: .default(Text("Confirm"), action: {
                            counter.increment()
                            counter.statogolfalse()
                            
                            
                        }),     secondaryButton: .destructive(Text("Dismiss")) {
                            counter.statogolfalse()
                    
                        }
                        )
                    }
                    .onReceive(timer) { _ in
                        if isRunning {
                            elapsedTime += 0.1
                        }
                    }
                }
            }
            
        }
    
}





     
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
