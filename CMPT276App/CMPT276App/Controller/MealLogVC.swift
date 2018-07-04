//
//  MealLogVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/2.
//  Copyright © 2018年 Nurture. All rights reserved.
//


import UIKit
import FirebaseAuth

//  Usage: allows user to create meal log
class MealLogVC: UIViewController {

    @IBOutlet weak var mealTitle: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var postBtn: UIButton!
    
    // When you click the create button, it will save the log in the cloud and display it in the main page
    @IBAction func OnPost(_ sender: UIButton) {
        if (mealTitle.text != "") {
            let user = Auth.auth().currentUser!.uid
            let newLog = MealLog(userid: user, mealtitle: mealTitle.text!, date: date.text!)
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
    
    //Cancel out of making a log
    @IBAction func back(_ sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }

}
