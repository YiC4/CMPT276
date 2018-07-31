//
//  CommentCell.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-30.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit
import Firebase

class CommentCell: UITableViewCell {//Formats Comment cell

    
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    
    var post: Post!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //configures the comment cell
    func configCell(post: Post){
        self.post = post
        self.userID.text = post.userID
        self.postText.text = post.postText
        
        
    }
}
