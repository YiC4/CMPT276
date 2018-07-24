//
//  SymptomVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-07-09.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit
import Charts

//Class for when you click on a symptom, it shows the symptom you clicked on and the logs it was recorded as
//Also shows a graph of what trimesters the symptom was recorded as
class SymptomVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var SymptomTitle: UILabel!
    @IBOutlet weak var TotalLogs: UILabel!
    @IBOutlet weak var TimesLogged: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var barChart: BarChartView!
    
    var symptomtitle: String!
    
    var symptomLogs = [MealLog]()
    
    var totalLogs = [MealLog]()
    var BloatingLogs = [MealLog]()
    var FatigueLogs = [MealLog]()
    var SwollenbreastsLogs = [MealLog]()
    var MorningsicknessLogs = [MealLog]()
    var FrequenturinationLogs = [MealLog]()
    var SpottingLogs = [MealLog]()
    var FoodaversionLogs = [MealLog]()
    var CravingsLogs = [MealLog]()
    var BackpainLogs = [MealLog]()
    
    var Bar1 = BarChartDataEntry(x: 1, yValues: [0])
    var Bar2 = BarChartDataEntry(x: 2, yValues: [0])
    var Bar3 = BarChartDataEntry(x: 3, yValues: [0])
    
    var Bars = [BarChartDataEntry]()
    
    var t1: Int!
    var t2: Int!
    var t3: Int!
    
    //once symptoms load, lead the logs, then load the graph
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.chartDescription?.text = "Trimester Graph"
        SymptomTitle.text = symptomtitle
        TotalLogs.text = "Total Logs: " + String(totalLogs.count)
        TimesLogged.text = "Times Symptom logged: " + String(symptomLogs.count)
        loadLogs()
        updateChartData()
    }
    
    func updateChartData(){
        
        Bar1.yValues = [Double(t1)]
        Bar2.yValues = [Double(t2)]
        Bar3.yValues = [Double(t3)]
        
        Bars = [Bar1, Bar2, Bar3]
        
        let xAxis = barChart.xAxis
        xAxis.valueFormatter = SymptomChartFormatter()
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 9)
        xAxis.granularity = 1
    
        
        barChart.pinchZoomEnabled = false
        barChart.doubleTapToZoomEnabled = false
        barChart.scaleXEnabled = true
        barChart.scaleYEnabled = true
        
        let chartDataSet = BarChartDataSet(values: Bars, label: nil)
        let chartData = BarChartData(dataSet: chartDataSet)
        chartDataSet.colors = ChartColorTemplates.pastel()
        
        barChart.data = chartData
        
    }
    
    //Populate the values of trimester 1, trimester 2, trimester 3
    //Depending on the which logs are which trimester
    func loadLogs(){
        t1 = 0
        t2 = 0
        t3 = 0
        for log in symptomLogs{
            if(log.Trimester == "1"){
                t1 = t1 + 1
            }
            else if(log.Trimester == "2"){
                t2 = t2 + 1
            }
            else if(log.Trimester == "3"){
                t3 = t3 + 1
            }
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symptomLogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Symptom Log Cell", for: indexPath as IndexPath) as! LogCell
        let log = symptomLogs[indexPath.row]
        
        cell.mealLog = log
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tojourneygraph" {
            if let destination = segue.destination as? JourneyGraphVC {
                destination.logs = totalLogs
                destination.BloatingLogs = BloatingLogs
                destination.FatigueLogs = FatigueLogs
                destination.SwollenbreastsLogs = SwollenbreastsLogs
                destination.MorningsicknessLogs = MorningsicknessLogs
                destination.FrequenturinationLogs = FrequenturinationLogs
                destination.SpottingLogs = SpottingLogs
                destination.FoodaversionLogs = FoodaversionLogs
                destination.CravingsLogs = CravingsLogs
                destination.BackpainLogs = BackpainLogs
            }
        }
    }


}
