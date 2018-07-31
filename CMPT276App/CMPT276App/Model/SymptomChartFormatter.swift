//
//  ChartStringFormatter.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-07-06.
//  Copyright © 2018 Nurture. All rights reserved.
//

import Foundation
import Charts

//Class to format the xaxis of the symptom graph
class SymptomChartFormatter: NSObject, IAxisValueFormatter {
    
    var nameValues: [String]! = ["", "trimester 1", "trimester 2", "trimester 3"]
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if(value < Double(nameValues.count)){
            return String(describing: nameValues[Int(value)])
        }
        return ""
    }
}
