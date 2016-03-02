//
//  NewNotesVC.swift
//  Your Valult
//
//  Created by amrit on 3/2/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit

class NewNotesVC: UIViewController {

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
    }

   
    

}
