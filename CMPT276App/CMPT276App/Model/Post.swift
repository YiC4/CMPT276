//
//  Post.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//

import Foundation
import Firebase
class Post{ // Forum Post Data Structure
    
    private var _userID: String!
    private var _postTitle: String!
    private var _postText: String!
    private var _postKey: String!
    
   let _postRef: DatabaseReference!
    
    var userID: String{
        return _userID
    }
    
    
    var postTitle: String{
        return _postTitle
    }
    
    var postText: String {
        return _postText
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(postTitle: String, postText: String, userID: String){
        _postTitle = postTitle
        _postText = postText
        _userID = userID
        _postRef = Database.database().reference().child("posts").childByAutoId()
    }
    
    init(snapshot: DataSnapshot){
        _postRef = snapshot.ref
        if let value = snapshot.value as? [String : Any] {
            _postText = value["postText"] as! String
            _postTitle = value["postTitle"] as! String
            _userID = value["userID"] as! String
        }
    }
    
    func save() {
        _postRef.setValue(toDictionary())
    }
    
    func toDictionary() -> [String : Any]{
        return [
            "userID" : userID,
            "postText" : postText,
            "postTitle" : postTitle
        
        ]
    }
    
    
}
