//
//  NewNotesVC.swift
//  Your Valult
//
//  Created by amrit on 3/2/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData

class NewNotesVC: UIViewController {
    
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var txtbody: UITextView!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        if txtbody.text != ""
                {
                    saveNotes()
        }
        
    }

    @IBAction func btnSave(sender: AnyObject) {
        saveNotes()
                
        
    }
    
    
    
    func saveNotes(){
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        let entity = NSEntityDescription.entityForName("Notes", inManagedObjectContext: Context)
        
        let NewNotes = Notes(entity: entity!, insertIntoManagedObjectContext: Context)
        
        
        
        NewNotes.bodyText = txtbody.text!
        NewNotes.createdDate = NSDate()
        
        do{
            
            try Context.save()
            print("Done")
            self.dismissViewControllerAnimated(true, completion: nil
            )
            
        }
        catch _ {
            
            
        }
    }
    
    
    

}
