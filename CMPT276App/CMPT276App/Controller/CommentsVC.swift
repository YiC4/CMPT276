//
//  CommentsVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-30.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class CommentsVC: UITableViewController {
    
    var post: Post!
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return posts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as?
                        CommentCell else {return UITableViewCell()}
        
        
        cell.configCell(post: posts[indexPath.row])


        return cell
    }
 

}
