//
//  PhotosVC.swift
//  Your Valult
//
//  Created by amrit on 3/11/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData
import LocalAuthentication

class PhotosVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var photodata: Array <AnyObject> = []

    
        override func viewDidLoad() {
        super.viewDidLoad()
            
                        
            
    }
    
    
    
        
    
    override func viewDidAppear(animated: Bool) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Photos")
        
        photodata = try! Context.executeFetchRequest(request)
        tableView.reloadData()
        
       
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photodata.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:PhotosCell = tableView.dequeueReusableCellWithIdentifier("cell") as! PhotosCell
       
        let data: NSManagedObject = photodata[indexPath.row] as! NSManagedObject
        cell.label?.text = data.valueForKey("picname") as? String
        
                
        cell.imageChoosed?.image =  UIImage(data:data.valueForKey("photo") as! NSData,scale:1.0)
       
        print(data.valueForKey("photo") )
            
        return cell

    
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let AppDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let Context: NSManagedObjectContext = AppDel.managedObjectContext
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            Context.deleteObject(photodata[indexPath.row] as! NSManagedObject )
            photodata.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        }
        
        do{
            
            try Context.save()
            print("Deleted")
            
        }
            
        catch _ {
            
        }
        
        
        
    }
    
   
    
    
}
