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


class JourneyVC: UIViewController{

    //var postsRef: DatabaseReference!
    //var logs = [Log]()
    //var selectedPost: MealLog!

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
    ///
    ///
    ///
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        //download posts
//        loadMealLogs()
//
//    }
//
//    func loadMealLogs(){
//
//        postsRef = Database.database().reference().child("users")
//
//        postsRef.observe(.value, with: {
//            (snapshot) in
//            self.posts.removeAll()//remove to refresh
//            //print(snapshot)
//            for child in snapshot.children {
//                let childSnapshot = child as! DataSnapshot
//                let post = Post(snapshot: childSnapshot)
//                self.posts.insert(post, at: 0)
//            }
//            print(self.posts)
//            self.tableView.reloadData()
//        })
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return posts.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
//        let post = posts[indexPath.row]
//
//        cell.post = post
//
//        return cell
//    }
//
//
//    @objc func toCreatePost(_ sender: AnyObject){
//        performSegue(withIdentifier: "toCreatePost", sender: nil)
//    }

}
