//
//  PostVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class PostVC: UIViewController {
    
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postText: UITextField!
    @IBOutlet weak var postBtn: UIButton!
    
    @IBAction func OnTitleFieldTap(_ sender: Any) {
        postTitle.text = ""
    }
    @IBAction func OnTextFieldTap(_ sender: Any) {
        postText.text = ""
    }
    
    @IBAction func postDidTouch(_ sender: UIButton) {
        if (postText.text != "" && postTitle.text != "") {
            let newPost = Post(postTitle: postTitle.text!, postText: postText.text!, userID: "testUser")
            newPost.save()
            self.navigationController!.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create Post"
        
        postText.text = "Describe"
        postTitle.text = "Title"
        
        postText.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func post(_ sender: AnyObject){ // use [command] + "/" to uncomment/comment blocks of code
//        let userID = Auth.auth().currentUser?.uid
//        Database.database().reference().child("posts").child(userID!).observeSingleEvent(of: .value, with: {
//            (snapshot) in
//
//            let data = snapshot.value as! Dictionary<String,AnyObject>
//            let userID = data["userID"]
//
//            let post: Dictionary<String, AnyObject> = [
//                "userID": userID as AnyObject,
//                "postText": self.postText.text as AnyObject,
//                "postTitle": self.postTitle.text as AnyObject
//            ]
//
//            let firebasePost = Database.database().reference().child("posts").childByAutoId();            firebasePost.setValue(post)
//        }) {(error) in
//            print(error.localizedDescription)
//        }
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
