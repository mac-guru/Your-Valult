//
//  EntryInternetAccountVC.swift
//  Your Valult
//
//  Created by amrit on 2/25/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData

class EntryInternetAccountVC: UIViewController {
    
    @IBOutlet var txtAccountName: UITextField!
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func btnCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func SaveInternetAccount(sender: AnyObject) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        let entity = NSEntityDescription.entityForName("InternetAccount", inManagedObjectContext: Context)
        
        let item = InternetAccount(entity: entity!, insertIntoManagedObjectContext: Context)
        
     
        
        item.internetAccount = txtAccountName.text!
        item.internetUserName = txtUserName.text!
        item.internetUserName = txtPassword.text!
        
        
        do{
            
            try Context.save()
            print("DOne")
            
        }
        catch _ {
            
        }

        
        
    }

        
        
    }
    
   


