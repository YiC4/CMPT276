	//
//  AppDelegate.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-06-20.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure() //IMPORTANT: CONFIGURES DATABASE BEFORE ANYTHING IS USED
        
        return true
        
    }
    
    
    
}

