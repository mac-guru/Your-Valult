//
//  InternetAccountVC.swift
//  Your Valult
//
//  Created by amrit on 2/25/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData

class InternetAccountVC: UIViewController, UITableViewDelegate {
    
    var InternetAc: Array <AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return InternetAc.count
        
    }
    
    @IBAction func touchbtn(sender: AnyObject) {
        print("a")
    }
    
}
