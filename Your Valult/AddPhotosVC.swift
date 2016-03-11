//
//  AddPhotosVC.swift
//  Your Valult
//
//  Created by amrit on 3/11/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit
import CoreData

class AddPhotosVC: UIViewController,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate  {
    
    
    @IBOutlet var txtPhotoTitle: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    var picker:UIImagePickerController?=UIImagePickerController()
    var popover:UIPopoverController?=nil
    var imageData: NSData?

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        picker!.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CancelVC(sender: AnyObject) {
    
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func btnPickImagge(sender: AnyObject) {
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openCamera()
                print("camera")
                
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel)
            {
                UIAlertAction in
                
        }
        
        // Add the actions
        picker?.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the controller
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: alert)
            
        }
       
    }
    
    
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            picker!.sourceType = UIImagePickerControllerSourceType.Camera
            self .presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            openGallary()
        }
    }
    func openGallary()
    {
        
        
        picker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: picker!)
                   }
    }

    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        picker .dismissViewControllerAnimated(true, completion: nil)
        imageView.image=info[UIImagePickerControllerOriginalImage] as? UIImage
        imageData = NSData(data: UIImageJPEGRepresentation(imageView.image!, 1.0)!)
        
    }

    
    
    
   
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func btnSave(sender: AnyObject) {
        
        
        let managedObjectContext =
        (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext

        
        let entityDescription = NSEntityDescription.entityForName("Photos",
            inManagedObjectContext: managedObjectContext)
        
        let photo = Photos(entity: entityDescription!,
            insertIntoManagedObjectContext: managedObjectContext)
        
        // add our data
        photo.setValue(txtPhotoTitle.text, forKey: "picname")
        photo.setValue(imageData, forKey: "photo")
        
        // save it
        do {
            // this was the problem ///////////////
            try managedObjectContext.save()
            print("Photo Saved")
            
        } catch {
            print("photo Not Saved")
        }
        
        // Dismiss the viewcontroller
        self.dismissViewControllerAnimated(true, completion: {});

        
    }
    
    
    
 
}
