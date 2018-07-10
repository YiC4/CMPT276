//
//  PostCell.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//
//

import UIKit
import Firebase

//Formats A Post Cell with title, text, and userID
class PostCell: UITableViewCell {
    
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    
    var post: Post! {
        didSet{
            userID.text = post.userID
            postText.text = post.postText
            postTitle.text = post.postTitle
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
