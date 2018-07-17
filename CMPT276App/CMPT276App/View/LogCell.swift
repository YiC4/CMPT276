//
//  LogCell.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/2.
//  Edited: Melissa Lee
//  Copyright © 2018年 Nurture. All rights reserved.
//

import UIKit

//Formats Meal Log Cell
class LogCell: UITableViewCell {
    
    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    //@IBOutlet weak var symptoms: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var mealLog: MealLog! {
        didSet{
            mealTitle.text = mealLog.MealTitle
            date.text = mealLog.Date
            let urlKey = mealLog.MealImg
            if let url = URL(string: urlKey!){
                do {
                    let data = try Data(contentsOf: url)
                    img.image = UIImage(data: data)!
                }catch {
                    print(" Error ")
                }
            }
            
            
//            if mealLog.Backpain == true {symptoms.text = symptoms.text! + "Backpain,"}
//            if mealLog.Bloating == true {symptoms.text = symptoms.text! + "Bloating,"}
//            if mealLog.Cravings == true {symptoms.text = symptoms.text! + "Cravings,"}
//            if mealLog.Fatigue == true {symptoms.text = symptoms.text! + "Fatigue,"}
//            if mealLog.Foodaversion == true {symptoms.text = symptoms.text! + "Foodaversion,"}
//            if mealLog.Frequenturination == true {symptoms.text = symptoms.text! + "Frequenturination,"}
//            if mealLog.Moodswings == true {symptoms.text = symptoms.text! + "Moodswings,"}
//            if mealLog.Morningsickness == true {symptoms.text = symptoms.text! + "Morningsickness,"}
//            if mealLog.Spotting == true {symptoms.text = symptoms.text! + "Spotting,"}
//            if mealLog.Swollenbreasts == true {symptoms.text = symptoms.text! + "Swollenbreasts"}
        }
    }

}
