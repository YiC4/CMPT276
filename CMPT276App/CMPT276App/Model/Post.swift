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
    var postComments = [Post]()
    
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
        postComments = [Post]()
        _postRef = Database.database().reference().child("posts").childByAutoId()
    }
    
    init(postKey:String,postData:Dictionary<String,Any>){
        _postKey = postKey
        if let userID = postData["userID"] as? String {
            _userID = userID
        }
        if let  postTitle = postData["postTitle"] as? String {
            _postTitle = postTitle
        }
        if let postText = postData["postText"] as? String {
            _postText = postText
        }
        
        if let postComments = postData["postComments"] as? [Post] {
            self.postComments = postComments
        }
        _postRef = Database.database().reference().child("posts").child(_postKey)
    }
    
    func save() {
        _postRef.setValue(toDictionary())
    }
    func saveComment(postkey: String) {
        let commentRef = Database.database().reference().child("posts").child(postkey).child("postComments").childByAutoId()
        commentRef.setValue(toDictionary())
    }
    
    func toDictionary() -> [String : Any]{
        return [
            "userID" : userID,
            "postText" : postText,
            "postTitle" : postTitle,
            "postComments" : postComments
            
        ]
    }
    
    
}
