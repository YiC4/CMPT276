//
//  JourneyVC.swift
//  P
//
//  Created by Lcy on 2018/7/2.
//  Copyright © 2018年 Lcy. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper


class JourneyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SignOut (_ sender: AnyObject) {
        try! Auth.auth().signOut()
        
        KeychainWrapper.standard.removeObject(forKey: "uid")
        
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
