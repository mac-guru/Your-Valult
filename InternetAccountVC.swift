//
//  InternetAccountVC.swift
//  Your Valult
//
//  Created by amrit on 2/25/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData

class InternetAccountVC:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
     var IA: Array <AnyObject> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  override func viewDidAppear(animated: Bool) {
    
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        let request = NSFetchRequest(entityName: "InternetAccount")
    
        IA = try! Context.executeFetchRequest(request)
        tableView.reloadData()
    
    }
    
    

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return IA.count
        
    }
    
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:InternetAccountCell = tableView.dequeueReusableCellWithIdentifier("cell") as! InternetAccountCell
        
        let data: NSManagedObject = IA[indexPath.row] as! NSManagedObject
        
      
        
        cell.lblInternetAccountName?.text = data.valueForKey("internetAccount") as? String
        cell.lblInternetAccoutUserName?.text = data.valueForKey("internetUserName") as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //Delete IA
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let Context: NSManagedObjectContext = AppDel.managedObjectContext

        if editingStyle == UITableViewCellEditingStyle.Delete {
            Context.deleteObject(IA[indexPath.row] as! NSManagedObject )
            IA.removeAtIndex(indexPath.row)
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
    
    if segue.identifier == "goToUpdateVC"{
    
    let selectedItem: NSManagedObject = IA[self.tableView.indexPathForSelectedRow!.row] as! NSManagedObject
    
    let updateVC : UpdateInternetAccountVC = segue.destinationViewController as! UpdateInternetAccountVC
        
        updateVC.accountName = selectedItem.valueForKey("internetAccount") as! String
        updateVC.userName = selectedItem.valueForKey("internetUserName") as! String
        updateVC.password = selectedItem.valueForKey("internetPassword") as! String
        
        updateVC.existingItem = selectedItem
        
    
    }
    
    
    }
    
    
  
    
}
