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
    
    var userid: String!
    var postsRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsRef = Database.database().reference().child("users").child(Auth.auth().currentUser!.uid)
        postsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? Dictionary<String,AnyObject>
            self.userid = value!["username"] as! String
        })
    }
    
    //set Post button
    @IBAction func OnPost(_ sender: UIButton) {
        if (self.postText.text != "" && self.postTitle.text != "") {
            let newPost = Post(postTitle: self.postTitle.text!, postText: self.postText.text!, userID: self.userid)
            newPost.save()
            self.navigationController!.popViewController(animated: true)
        }
    }
}

