//
//  NotesVC.swift
//  Your Valult
//
//  Created by amrit on 3/2/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData

class NotesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var notesTableView: UITableView!
    
      var Notes: Array <AnyObject> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Notes")
        
        Notes = try! Context.executeFetchRequest(request)
        notesTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Notes.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        
        let cell:NotesCell = tableView.dequeueReusableCellWithIdentifier("NotesCell") as! NotesCell
        
     
        
        

        let data: NSManagedObject = Notes[indexPath.row] as! NSManagedObject
        

        cell.lblNotesTitle?.text = data.valueForKey("bodyText") as? String
       
        
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let d = data.valueForKey("createdDate") as? NSDate
                    let s = dateFormatter.stringFromDate(d!)
                    print(s)
        
                    cell.lblNotesDate.text = s


        
 
        
        return cell
        
    }
    

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            Context.deleteObject(Notes[indexPath.row] as! NSManagedObject )
            Notes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
        
        do{
            
            try Context.save()
            print("Deleted")
            
        }
            
        catch _ {
            
        }
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "updateNotes"{
          
            
            let selectedNotes: NSManagedObject = Notes[self.notesTableView.indexPathForSelectedRow!.row] as! NSManagedObject
            
          
            
            let updateVC: updateNotesVC = segue.destinationViewController as! updateNotesVC
            
            updateVC.NotesBody = selectedNotes.valueForKey("bodyText") as! String
            updateVC.existingNotes = selectedNotes
            
            
            
        }
        
        
        
    }
    
    



  
}
