//
//  MealLogVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/2.
//  Copyright © 2018年 Nurture. All rights reserved.
//
//  Usage: allows user to create meal log

import UIKit
import FirebaseAuth

class MealLogVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    var Bloating: Bool!
    var Fatigue: Bool!
    var Swollenbreasts: Bool!
    var Morningsickness: Bool!
    var Moodswings: Bool!
    var Frequenturination: Bool!
    var Spotting: Bool!
    var Foodaversion: Bool!
    var Cravings: Bool!
    var Backpain: Bool!
    
    @IBOutlet weak var mealTitle: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var postBtn: UIButton!
    
    @IBOutlet weak var imageViewer: UIImageView!
    
    @IBAction func imagePicker(_ sender: Any)
    {
        let mealImage = UIImagePickerController()
        mealImage.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
           
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                mealImage.sourceType = .camera
                self.present(mealImage, animated: true, completion: nil)
            } else {
                AlertController.showAlert(self, title: "Error", message: "Camera not available")
            }
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action: UIAlertAction) in
            mealImage.sourceType = .photoLibrary
            self.present(mealImage, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageViewer.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func OnPost(_ sender: UIButton) {
        if (mealTitle.text != "") {
            let user = Auth.auth().currentUser!.uid
            let newLog = MealLog(userid: user, mealtitle: mealTitle.text!, date: date.text!)
            
            if Bloating == true {newLog.Bloating = true}
            if Fatigue == true {newLog.Fatigue = true}
            if Swollenbreasts == true {newLog.Swollenbreasts = true}
            if Morningsickness == true {newLog.Morningsickness = true}
            if Moodswings == true {newLog.Moodswings = true}
            if Spotting == true {newLog.Spotting = true}
            if Foodaversion == true {newLog.Foodaversion = true}
            if Cravings == true {newLog.Cravings = true}
            if Backpain == true {newLog.Backpain = true}
            if Frequenturination == true {newLog.Frequenturination = true}
            
            newLog.save()
            dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back(_ sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func BloatingTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Bloating = false
        } else {
            sender.isSelected = true
            Bloating = true
        }
    }
    
    @IBAction func FatigueTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Fatigue = false
        } else {
            sender.isSelected = true
            Fatigue = true
        }
    }
    
    @IBAction func SwollenbreastsTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Swollenbreasts = false
        } else {
            sender.isSelected = true
            Swollenbreasts = true
        }
    }
    
    @IBAction func MorningsicknessTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Morningsickness = false
        } else {
            sender.isSelected = true
            Morningsickness = true
        }
    }
        
    @IBAction func MoodswingsTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Moodswings = false
        } else {
            sender.isSelected = true
            Moodswings = true
        }
    }
        
    @IBAction func SpottingTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Spotting = false
        } else {
            sender.isSelected = true
            Spotting = true
        }
    }
        
    @IBAction func FoodaversionTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Foodaversion = false
        } else {
            sender.isSelected = true
            Foodaversion = true
        }
    }
    
    @IBAction func CravingsTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Cravings = false
        } else {
            sender.isSelected = true
            Cravings = true
        }
    }
    
    @IBAction func BackpainTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Backpain = false
        } else {
            sender.isSelected = true
            Backpain = true
        }
    }
    
    @IBAction func FrequenturinationTapped(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            Frequenturination = false
        } else {
            sender.isSelected = true
            Frequenturination = true
        }
    }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

}
