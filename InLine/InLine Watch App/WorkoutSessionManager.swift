//
//  WorkoutSessionManager.swift
//  InLine Watch App
//
//  Created by mattia on 12/07/23.
//

import Foundation
import Combine
import WatchConnectivity
import HealthKit

class WorkoutSessionManager: NSObject, HKWorkoutSessionDelegate, HKLiveWorkoutBuilderDelegate, WCSessionDelegate {
    
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    

    let healthStore = HKHealthStore()
    var workoutSession: HKWorkoutSession?
    var workoutBuilder: HKLiveWorkoutBuilder?
    //let countSubject: PassthroughSubject<Int, Never>
    //let booleanoSubject: PassthroughSubject<Bool, Never>
  //  let session: WCSession? = WCSession.isSupported() ? WCSession.default : nil

  

    let typesToShare: Set<HKSampleType> = [
        HKObjectType.workoutType()
    ]

    let typesToRead: Set<HKObjectType> = [
        HKObjectType.quantityType(forIdentifier: .heartRate)!,
        HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
        HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!
    ]

    override init() {
        //self.countSubject = PassthroughSubject<Int, Never>()
       // self.booleanoSubject = PassthroughSubject<Bool, Never>()
        super.init()
        //var session: WCSession

        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            // Handle errors here.
        }
    }
 

    func startWorkoutSession() {
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .running
        configuration.locationType = .outdoor
        //var session: WCSession
        //let delegate: WCSessionDelegate
        

        do {
            workoutSession = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            workoutBuilder = workoutSession?.associatedWorkoutBuilder()
        } catch {
            // Handle failure here.
            return
        }

        workoutBuilder?.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: configuration)

        workoutSession?.delegate = self
        workoutBuilder?.delegate = self
      //  session?.delegate = self
       // session?.activate()
        

        workoutSession?.startActivity(with: Date())
        workoutBuilder?.beginCollection(withStart: Date()) { (success, error) in
            guard success else {
                // Handle errors.
                return
            }

            // Indicate that the session has started.
        }
    }
    
    /*
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
    */
     

    func endWorkoutSession() {
        workoutSession?.end()
    }

    // MARK: - HKWorkoutSessionDelegate

    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        // Handle workout session state changes here.
    }

    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        startWorkoutSession()
    }

    // MARK: - HKLiveWorkoutBuilderDelegate

    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes {
            guard let quantityType = type as? HKQuantityType else {
                return // Nothing to do.
            }

            // Calculate statistics for the type.
            let statistics = workoutBuilder.statistics(for: quantityType)

        }
    }

    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        let lastEvent = workoutBuilder.workoutEvents.last

        DispatchQueue.main.async {
            // Update the user interface with the collected event.
        }
    }
}

