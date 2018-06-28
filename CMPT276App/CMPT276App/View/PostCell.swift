//
//  PostCell.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    
    var post: Post!
    //var userPostKey: DatabaseReference!
    //let currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(post: Post){
        self.post = post
        self.username.text = post.username
        self.postText.text = post.postText
        
        //let ref = Storage.storage().reference(forURL: post.userImg)
//        ref.getData(withMaxSize: 10000000, completion: { (data, error) in
//            if error != nil {
//                print("Could not load image")
//            } else {
//                if let imgData = data {
//                    if let img = UIImage(data: imgData){
//                        self.userImg.image = img
//                    }
//                }
//            }
//        } )
        
    }

}
