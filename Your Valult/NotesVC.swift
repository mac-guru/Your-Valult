//
//  NotesVC.swift
//  Your Valult
//
//  Created by amrit on 3/2/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit

class NotesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var notesTableView: UITableView!
    
     var Notes = ["Hi Everyone", "Nepal", "Aout Sofwarica College", "Decent Nepali" , "Nepali Movies in rock", "Get rock in the city", "University in Nepal", "It Scopes"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            cell.lblNotesTitle.text = Notes[indexPath.row]
        
        
        
        return cell
        
    }
    
  
    

    

  
}
