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
    @IBOutlet weak var symptoms: UILabel!
    
    var mealLog: MealLog! {
        didSet{
            mealTitle.text = mealLog.MealTitle
            date.text = mealLog.Date
            //todo: symptom show
        }
    }

}
