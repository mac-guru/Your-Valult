//
//  UpdateInternetAccountVC.swift
//  Your Valult
//
//  Created by amrit on 3/1/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData



class UpdateInternetAccountVC: UIViewController {

    @IBOutlet var txtAccountName: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtUserName: UITextField!
    
    @IBOutlet var btnUpdate: UIButton!
    @IBOutlet var btnCancel: UIButton!
    
    var accountName:String = ""
    var userName:String = ""
    var password:String = ""
    
    var existingItem: NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if existingItem != nil{
            txtAccountName.text = accountName
            txtUserName.text = userName
            txtPassword.text = password
        
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btnCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        
        textField.resignFirstResponder()
        
        return false
    }
    
    
    @IBAction func btnUpdate(sender: AnyObject) {
       
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
       // let entity = NSEntityDescription.entityForName("InternetAccount", inManagedObjectContext: Context)
        
        if existingItem != nil {
            
            existingItem.setValue(txtAccountName.text as String?, forKey:"internetAccount" )
            existingItem.setValue(txtUserName.text as String?, forKey:"internetUserName" )
            existingItem.setValue(txtPassword.text as String?, forKey: "internetPassword")
            existingItem.setValue(NSDate(), forKey: "pwdUpdatedDate")
            
            }
        
        
        
        do{
            
            try Context.save()
            print("Updated")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        catch _ {
            
        }
        
        
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}
