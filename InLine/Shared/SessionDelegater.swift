//
//  SessionDelegater.swift
//  InLine
//
//  Created by mattia on 29/06/23.
//


import Foundation
import Combine
import WatchConnectivity

class SessionDelegater: NSObject, WCSessionDelegate {
    let countSubject: PassthroughSubject<Int, Never>
    let booleanoSubject: PassthroughSubject<Bool, Never>

    
    init(countSubject: PassthroughSubject<Int, Never>,booleanoSubject: PassthroughSubject<Bool, Never>) {
        self.countSubject = countSubject
        self.booleanoSubject = booleanoSubject
        super.init()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Protocol comformance only
        // Not needed for this demo
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            if let count = message["count"] as? Int{
                self.countSubject.send(count)
            } else {
                print("There was an error")
            }
            
            if let booleano = message["booleano"]as? Bool{
                self.booleanoSubject.send(booleano)
            }
            else {
                print("There was an error")
            }
        }
    }
    
    // iOS Protocol comformance
    // Not needed for this demo otherwise
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // Activate the new session after having switched to a new watch.
        session.activate()
    }
    
    func sessionWatchStateDidChange(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    #endif
}
