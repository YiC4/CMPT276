//
//  RoleVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/2.
//  Copyright © 2018年 Nurture. All rights reserved.
//


import UIKit

//  Usage: will determine if user is dietition or expecting
class RoleVC: UIViewController { //TODO: INITIALIZATION PAGE

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func IAmExpecting(_sender: Any) {
    }
    
    
    
    
    @IBAction func cancel(_ sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }
    
}
