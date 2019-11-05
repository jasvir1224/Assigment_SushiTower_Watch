//
//  InterfaceController.swift
//  SushiWatch Extension
//
//  Created by Jasvir Kaur on 2019-11-02.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    @IBAction func powerButton() {
    
    }
    
    @IBAction func resumeButton() {
        
        if (WCSession.default.isReachable == true) {
            // Here is the message you want to send to the watch
            // All messages get sent as dictionaries
            let message = ["message":"resume"]as [String : Any]
            // Send the message
            WCSession.default.sendMessage(message, replyHandler:nil)
            print("Message Sent")}
        else {
            print("Cannot reach watch!")
            
        }
    }
    
    @IBAction func pauseButton() {
        
        if (WCSession.default.isReachable == true) {
            // Here is the message you want to send to the watch
            // All messages get sent as dictionaries
            let message = ["message":"pause"]as [String : Any]
            // Send the message
            WCSession.default.sendMessage(message, replyHandler:nil)
            print("Message Sent")}
        else {
            print("Cannot reach watch!")
            
        }
    }
    @IBOutlet weak var timeLabel: WKInterfaceLabel!
    @IBAction func leftButton() {
        
        if (WCSession.default.isReachable == true) {
            // Here is the message you want to send to the watch
            // All messages get sent as dictionaries
            let message = ["message":"Left"]as [String : Any]
            // Send the message
       WCSession.default.sendMessage(message, replyHandler:nil)
           print("Message Sent")}
        else {
           print("Cannot reach watch!")
            
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        
        let time = message["time"] as! String
        timeLabel.setText("Time:\(time) seconds")
     if(time == "0")
        {timeLabel.setText("Game Over!")} }

    
    @IBAction func RightButton() {
        if (WCSession.default.isReachable == true) {
            // Here is the message you want to send to the watch
            // All messages get sent as dictionaries
            let message = ["message":"Right"]as [String : Any]
            // Send the message
            WCSession.default.sendMessage(message, replyHandler:nil)
            print("Message Sent")}
        else {
            print("Cannot reach watch!")
            
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        if (WCSession.isSupported() == true) {
            print("WC is supported!")
            // create a communication session with the phone
            let session = WCSession.default
            session.delegate = self
            session.activate()}
        else {print("WC NOT supported!")}}

}
