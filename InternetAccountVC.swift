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
    
    var InternetAc = ["facebook", "twitter", "snapchat" , "Nabil Bank" , "Github" , "router password", "Disney Channel", "Netflix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return InternetAc.count
        
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:InternetAccountCell = tableView.dequeueReusableCellWithIdentifier("cell") as! InternetAccountCell
        cell.lblInternetAccountName.text = InternetAc[indexPath.row]
        return cell
        
        
        
        
        
    }

    
  
    
}
