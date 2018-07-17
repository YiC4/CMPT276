//
//  ConnectVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//
//  Usage: Populates TableView with Forum Posts

import UIKit
import Firebase
import SwiftKeychainWrapper

class ConnectVC: UITableViewController {
    
    @IBOutlet var postview: UITableView!
    var postsRef: DatabaseReference!
    var posts = [Post]()
    var myindex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //download posts
        loadPosts()
        
        
    }
    
    //Loads Forum Posts
    func loadPosts(){
        postsRef = Database.database().reference().child("posts")
        
        postsRef.observe(.value, with: {
            (snapshot) in
            guard let snapshot = snapshot.children.allObjects as?[DataSnapshot] else {return}
            self.posts.removeAll()//remove to refresh
            //print(snapshot)
            for data in snapshot.reversed() {
                guard let postdict = data.value as? Dictionary<String,AnyObject> else {return}
                let post = Post(postKey: data.key, postData: postdict)
                self.posts.append(post)
            }
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
    
    //Loads Forum Posts and populates table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = posts[indexPath.row]
        
        cell.post = post
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myindex = indexPath.row
        performSegue(withIdentifier: "tocomments", sender: posts[myindex])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tocomments" {
            if let destination = segue.destination as? CommentsVC {
                destination.post = self.posts[myindex]
            }
        }
    }
    @IBAction func back(_ sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }
    
    
}
