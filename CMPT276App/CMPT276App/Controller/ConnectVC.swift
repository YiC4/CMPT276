//
//  ConnectVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class ConnectVC: UITableViewController {
    
    var postsRef: DatabaseReference!
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //download posts
        loadPosts()
        
    }
    
    func loadPosts(){

        postsRef = Database.database().reference().child("posts")
        
        postsRef.observe(.value, with: {
            (snapshot) in
            self.posts.removeAll()//remove to refresh
            //print(snapshot)
            for child in snapshot.children {
                let childSnapshot = child as! DataSnapshot
                let post = Post(snapshot: childSnapshot)
                self.posts.insert(post, at: 0)
            }
            print(self.posts)
            self.tableView.reloadData()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = posts[indexPath.row]
        
        cell.post = post
        print(post.postTitle)
        print(post.postText)
        print(post.userID)
        
        return cell
    }
    
    @IBAction func back(_ sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }


}
