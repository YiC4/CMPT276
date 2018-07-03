//
//  RoleVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/2.
//  Copyright © 2018年 Nurture. All rights reserved.
//
//  Usage: will determine if user is dietition or expecting

import UIKit

class RoleVC: UIViewController {

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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
