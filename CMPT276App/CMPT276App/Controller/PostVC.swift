//
//  PostVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//
//  Usage: Creates Posts with Title, Text, and User ID

import UIKit
import Firebase
import SwiftKeychainWrapper

class PostVC: UIViewController {
    
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postText: UITextField!
    @IBOutlet weak var postBtn: UIButton!

    
    @IBAction func OnPost(_ sender: UIButton) {

        if (postText.text != "" && postTitle.text != "") {
            let newPost = Post(postTitle: postTitle.text!, postText: postText.text!, userID: "testUser")
            newPost.save()
            self.navigationController!.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
