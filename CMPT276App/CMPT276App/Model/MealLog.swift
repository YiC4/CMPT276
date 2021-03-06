//
//  MealLog.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/2.
//  Copyright © 2018年 Nurture. All rights reserved.
//

import Foundation
import Firebase
class MealLog{ // Meal Log Data Structure
    
    var UserID: String!
    var MealTitle: String!
    var Date: String!
    var Trimester: String!
    var MealImg: String!
    
    var Bloating: Bool!
    var Fatigue: Bool!
    var Swollenbreasts: Bool!
    var Morningsickness: Bool!
    var Moodswings: Bool!
    var Frequenturination: Bool!
    var Spotting: Bool!
    var Foodaversion: Bool!
    var Cravings: Bool!
    var Backpain: Bool!
    
    
    let _postRef: DatabaseReference!
    
    init(userid: String, mealtitle: String, date: String, trimester: String, mealImg: String) {//for meallog creation
        UserID = userid
        MealTitle = mealtitle
        Date = date
        Trimester = trimester
        MealImg = mealImg
        
        Bloating = false
        Fatigue = false
        Swollenbreasts = false
        Morningsickness = false
        Moodswings = false
        Frequenturination = false
        Spotting = false
        Foodaversion = false
        Cravings = false
        Backpain = false
       
        _postRef = Database.database().reference().child("users").child(UserID).child("mealLog").child(mealtitle)
    }
    
    init(snapshot: DataSnapshot){
        _postRef = snapshot.ref
        if let value = snapshot.value as? [String : Any] {
            UserID = value["UserID"] as! String
            MealTitle = value["MealTitle"] as! String
            Date = value["Date"] as! String
            Trimester = value["Trimester"] as! String
            MealImg = value["MealImg"] as! String
            
            Bloating = value["Bloating"] as! Bool
            Fatigue = value["Fatigue"] as! Bool
            Swollenbreasts = value["Swollenbreasts"] as! Bool
            Morningsickness = value["Morningsickness"] as! Bool
            Moodswings = value["Moodswings"] as! Bool
            Frequenturination = value["Frequenturination"] as! Bool
            Spotting = value["Spotting"] as! Bool
            Foodaversion = value["Foodaversion"] as! Bool
            Cravings = value["Cravings"] as! Bool
            Backpain = value["Backpain"] as! Bool
        }
    }
    func save() {
        _postRef.setValue(toDictionary())
    }
    
    func toDictionary() -> [String : Any]{
        return [
            "UserID" : UserID,
            "MealTitle" : MealTitle,
            "Date" : Date,
            "Trimester" : Trimester,
            "MealImg": MealImg,
            
            "Bloating": Bloating,
            "Fatigue": Fatigue,
            "Swollenbreasts" : Swollenbreasts,
            "Morningsickness" : Morningsickness,
            "Moodswings" : Moodswings,
            "Frequenturination" : Frequenturination,
            "Spotting" : Spotting,
            "Foodaversion" : Foodaversion,
            "Cravings" : Cravings,
            "Backpain" : Backpain
        ]
    }
    
    
}
