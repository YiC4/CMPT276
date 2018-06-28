//
//  Post.swift
//  CMPT276App
//
//  Created by Michael Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//

import Foundation
//import Firebase
class Post{
    private var _username: String!
    //private var _userImg: String!
    private var _postTitle: String!
    private var _postText: String!
    private var _postKey: String!

    //private var _postRef: DatabaseReference!
    
    
    var username: String{
        return _username
    }
    
    //var userImg: String{
    //    return _userImg
    //}
    
    var postTitle: String{
        return _postTitle
    }
    
    var postText: String {
        return _postText
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(postTitle: String, postText: String, username: String){
        _postTitle = postTitle
        _postText = postText
        _username = username
    }
    
    init(postKey: String, postData: Dictionary<String,AnyObject>){//TODO: IMPLEMENT FIREBASE FOR ADDING A POST INTO A DATABASE
        _postKey = postKey
        if let username = postData["username"] as? String{
            _username = username
        }
        
        if let postText = postData["postText"] as? String {
            _postText = postText
        }
        
        //_postRef = Database.database().reference().child("posts").child(_postKey)
        
    }
    
    
    
}
