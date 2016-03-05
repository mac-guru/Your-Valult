//
//  updateNotesVC.swift
//  Your Valult
//
//  Created by amrit on 3/4/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData

class updateNotesVC: UIViewController {
    
    @IBOutlet var txtBody: UITextView!
    
    var NotesBody:String = ""
    
    var existingNotes: NSManagedObject!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if existingNotes != nil{
            txtBody.text = NotesBody
            
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func btnSave(sender: AnyObject) {
               
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        // let entity = NSEntityDescription.entityForName("InternetAccount", inManagedObjectContext: Context)
        
        if existingNotes != nil {
            
            existingNotes.setValue(txtBody.text as String?, forKey: "bodyText")
            existingNotes.setValue(NSDate(), forKey: "createdDate")
            
        }
        
        
        
        do{
            
            try Context.save()
            print("Updated")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        catch _ {
            
        }
        

        
    }
    

}
