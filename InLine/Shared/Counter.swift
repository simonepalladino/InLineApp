//
//  Counter.swift
//  InLine
//
//  Created by mattia on 29/06/23.
//

import Foundation
import Combine
import WatchConnectivity
import HealthKit

final class Counter: ObservableObject {
    var session: WCSession
    let delegate: WCSessionDelegate
    let subject = PassthroughSubject<Int, Never>()
    let boolsubject = PassthroughSubject<Bool, Never>()
    
    
    
    @Published private(set) var count: Int = 0
    @Published private(set) var booleano: Bool = false
    
    init(session: WCSession = .default) {
        self.delegate = SessionDelegater(countSubject: subject, booleanoSubject: boolsubject)
        self.session = session
        self.session.delegate = self.delegate
        self.session.activate()
        
        
        subject
            .receive(on: DispatchQueue.main)
            .assign(to: &$count)
        boolsubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$booleano)
        // The quantity type to write to the health store.
     
    }
        
    
    func increment() {
        count += 1
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    func decrement() {
        count -= 1
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    func statogoltrue() {
        booleano = true
        session.sendMessage(["booleano": booleano], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    func statogolfalse() {
        booleano = false
        session.sendMessage(["booleano": booleano], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    func zero(){
        count = 0
        session.sendMessage(["count": count], replyHandler: nil) {error in
            print(error.localizedDescription)
        }
    }
}
