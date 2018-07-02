//
//  AppDelegate.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-20.
//  Copyright © 2018 Nurture. All rights reserved.
//

//let testPost = Post(postTitle: "This is title", postText: "This is title", userID: "this is userID")
//testPost.save()

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }
    
    
    
}

