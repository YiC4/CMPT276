//
//  CommentsVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-30.
//  Copyright © 2018 Nurture. All rights reserved.
//  Usage: allow user to leave comment
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class CommentsVC: UITableViewController {// TODO: CREATE COMMENTS THAT ATTACH TO POST
    
    var post: Post!
    var userid: String!
    var comments = [Post]()
    var postsRef: DatabaseReference!
    
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var commentBtn: UIButton!
    
    var myindex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userID.text = post.userID
        postText.text = post.postText
        postTitle.text = post.postTitle
        loadcomment()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Loads Forum Posts
    func loadcomment(){
        print("loading comments")
        
        postsRef = Database.database().reference().child("posts").child(post.postKey).child("postComments")
        postsRef.observe(.value, with: {
            (snapshot) in
            guard let snapshot = snapshot.children.allObjects as?[DataSnapshot] else {return}
            self.comments.removeAll()//remove to refresh
            for data in snapshot.reversed() {
                guard let postdict = data.value as? Dictionary<String,AnyObject> else {return}
                let comment = Post(postKey: data.key, postData: postdict)
                self.comments.append(comment)
                print(comment.postText)
            }
            
            self.tableView.reloadData()
        })
        postsRef = Database.database().reference().child("users").child(Auth.auth().currentUser!.uid)
        postsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? Dictionary<String,AnyObject>
            self.userid = value!["username"] as! String
        })
        
        
    }
    
    //set Psot button
    @IBAction func OnPost(_ sender: UIButton) {
        if (commentText.text != "") {
            
            let newPost = Post(postTitle: "", postText: commentText.text!, userID: userid)
            newPost.saveComment(postkey: post.postKey)
            loadcomment()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("table reload")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as!
        PostCell
        let comment = comments[indexPath.row]
        
        cell.post = comment
        return cell
    }
}
