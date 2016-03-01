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
    @IBOutlet var lblTitle: UILabel!
    
    
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
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        let nextTag: Int = textField.tag + 1
        
        let nextResponder: UIResponder? = textField.superview?.superview?.viewWithTag(nextTag)
        
        if let nextR = nextResponder
        {
            // Found next responder, so set it.
            nextR.becomeFirstResponder()
        }
        else
        {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    
    
    @IBAction func SaveInternetAccount(sender: AnyObject) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        let entity = NSEntityDescription.entityForName("InternetAccount", inManagedObjectContext: Context)
        
        let item = InternetAccount(entity: entity!, insertIntoManagedObjectContext: Context)
        
     
        item.internetAccount = txtAccountName.text!
        item.internetUserName = txtUserName.text!
        item.internetPassword = txtPassword.text!
        
        
        do{
            
            try Context.save()
            print("Done")
            self.dismissViewControllerAnimated(true, completion: nil
            )
            
        }
        catch _ {
            
            
        }
        
        txtAccountName.resignFirstResponder()
        txtUserName.resignFirstResponder()
        txtPassword.resignFirstResponder()

        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
         self.view.endEditing(true)
    }

        
        
    }
    
   


