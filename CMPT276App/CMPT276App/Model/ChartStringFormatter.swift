//
//  ChartStringFormatter.swift
//  CMPT276App
//
//  Created by Michael Lee on 2018-07-06.
//  Copyright © 2018 Nurture. All rights reserved.
//

import Foundation
import Charts

class ChartStringFormatter: NSObject, IAxisValueFormatter {
    
    var nameValues: [String]! = ["", "Bloating", "Fatigue", "Swollen Breasts", "Morning Sickness", "Frequent Urnination", "Spotting", "Food Aversion", "Cravings", "Back Pain"]
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if(value < Double(nameValues.count)){
            return String(describing: nameValues[Int(value)])
        }
        return ""
    }
}
