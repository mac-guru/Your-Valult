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
    
    
//    var ac = ["a", "b"]
  
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

    
  
    
}
