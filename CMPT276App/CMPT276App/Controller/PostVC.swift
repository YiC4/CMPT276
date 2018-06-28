//
//  PostVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit

class PostVC: UIViewController {
    
    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var postTitle: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func post(_ sender: AnyObject){ // use [command] + "/" to uncomment/comment blocks of code
//        let userID = Auth.auth().currentUser?.uid
//        Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with {
//            (snapshot) in
//
//            let data = snapshot.value as! Dictionary<String,AnyObject>
//            let username = data["username"]
//
//            let post: Dictionary<String, AnyObject> = [
//                "username": username as AnyObject,
//                "postText": self.postText.text as AnyObject,
//                "postTitle": self.postTitle.text as AnyObject
//            ]
//
//            let firebasePost = Database.database().reference().child("textPosts").childByAutoID()
//            firebasePost.setValue(post)
//        }) {(error) in
//            print(error.localizedDescription)
//        }
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
