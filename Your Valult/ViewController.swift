//
//  ViewController.swift
//  Your Valult
//
//  Created by amrit on 2/17/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func authenticateUser(){
        let touchContext: LAContext = LAContext()
        
        
        //try touchContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics)
        touchContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "To unlock the vault, tap the Touch ID (home) button.", reply: {
            
            (success: Bool, error: NSError?) -> Void in
            if success {
                dispatch_async(dispatch_get_main_queue(), {
                    self.gotoHome()
                    
                })
                
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    switch error!.code{
                    case LAError.UserCancel.rawValue:
                        
                        UIAlertView(title: "Cancled", message: "Cancled", delegate: nil, cancelButtonTitle: "OK").show()
                    
                    case  LAError.UserFallback.rawValue:
                        
                        UIAlertView(title: "No password", message: "Only fingerprint can be used", delegate: nil, cancelButtonTitle: "OK").show()
                        
                    default:
                        print("Nothing");
                    
                    }
                    
                    
                    
                    
                    
                    
                })
            }
        })

    }
    
    func gotoHome(){
        performSegueWithIdentifier("sucess", sender: self)
    }

    @IBAction func unlock(sender: AnyObject) {
        authenticateUser()
    }
    
}

