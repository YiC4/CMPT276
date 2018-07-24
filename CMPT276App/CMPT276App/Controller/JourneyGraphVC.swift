//
//  JourneyGraphVC.swift
//  CMPT276App
//
//  Created by Melissa Lee on 2018-07-05.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit
import Charts


class JourneyGraphVC: UIViewController{
    
    @IBOutlet var barChart: BarChartView!
    
    var logs = [MealLog]()
    
    var BloatingLogs = [MealLog]()
    var FatigueLogs = [MealLog]()
    var SwollenbreastsLogs = [MealLog]()
    var MorningsicknessLogs = [MealLog]()
    var FrequenturinationLogs = [MealLog]()
    var SpottingLogs = [MealLog]()
    var FoodaversionLogs = [MealLog]()
    var CravingsLogs = [MealLog]()
    var BackpainLogs = [MealLog]()
    
    var BloatingTapped = false
    var FatigueTapped = false
    var SwollenbreastsTapped = false
    var MorningsicknessTapped = false
    var FrequenturinationTapped = false
    var SpottingTapped = false
    var FoodaversionTapped = false
    var CravingsTapped = false
    var BackpainTapped = false

    var Bar1 = BarChartDataEntry(x: 1, yValues: [0])
    var Bar2 = BarChartDataEntry(x: 2, yValues: [0])
    var Bar3 = BarChartDataEntry(x: 3, yValues: [0])
    var Bar4 = BarChartDataEntry(x: 4, yValues: [0])
    var Bar5 = BarChartDataEntry(x: 5, yValues: [0])
    var Bar6 = BarChartDataEntry(x: 6, yValues: [0])
    var Bar7 = BarChartDataEntry(x: 7, yValues: [0])
    var Bar8 = BarChartDataEntry(x: 8, yValues: [0])
    var Bar9 = BarChartDataEntry(x: 9, yValues: [0])

    var numberOfLogsDataEntries = [BarChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Bar1.yValues = [Double(BloatingLogs.count)]
        Bar2.yValues = [Double(FatigueLogs.count)]
        Bar3.yValues = [Double(SwollenbreastsLogs.count)]
        Bar4.yValues = [Double(MorningsicknessLogs.count)]
        Bar5.yValues = [Double(FrequenturinationLogs.count)]
        Bar6.yValues = [Double(SpottingLogs.count)]
        Bar7.yValues = [Double(FoodaversionLogs.count)]
        Bar8.yValues = [Double(CravingsLogs.count)]
        Bar9.yValues = [Double(BackpainLogs.count)]
    
        numberOfLogsDataEntries = [Bar1, Bar2, Bar3, Bar4, Bar5, Bar6, Bar7, Bar8, Bar9]
        
        self.title = "Journey Graph"
        barChart.chartDescription?.text = "Journey Graph"
        
        let xAxis = barChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 9)
        xAxis.granularity = 1
        xAxis.labelCount = 9
        
        let formatter = ChartStringFormatter()
        xAxis.valueFormatter = formatter
    
        barChart.pinchZoomEnabled = false
        barChart.doubleTapToZoomEnabled = false
        barChart.scaleXEnabled = true
        barChart.scaleYEnabled = true
        
        barChart.zoom(scaleX: 2.5, scaleY: 0, x: 0, y: 0)
        
        updateChartData()
        // Do any additional setup after loading the view.
    }

    
    func updateChartData(){
        let chartDataSet = BarChartDataSet(values: numberOfLogsDataEntries, label: nil)
        let chartData = BarChartData(dataSet: chartDataSet)
        chartDataSet.colors = ChartColorTemplates.pastel()
        
        barChart.data = chartData
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSymptom" {
            if let destination = segue.destination as? SymptomVC {
                if BloatingTapped == true {
                    destination.symptomtitle = "Symptom: Bloating"
                    destination.symptomLogs = BloatingLogs
                    BloatingTapped = false
                }
                else if FatigueTapped {
                    destination.symptomtitle = "Symptom: Fatigue"
                    destination.symptomLogs = FatigueLogs
                    FatigueTapped = false
                }
                else if SwollenbreastsTapped{
                    destination.symptomtitle = "Symptom: Swollen Breasts"
                    destination.symptomLogs = SwollenbreastsLogs
                    SwollenbreastsTapped = false
                }
                else if MorningsicknessTapped {
                    destination.symptomtitle = "Symptom: Morning Sickness"
                    destination.symptomLogs = MorningsicknessLogs
                    MorningsicknessTapped = false
                }
                else if FrequenturinationTapped{
                    destination.symptomtitle = "Symptom: Frequent Urination"
                    destination.symptomLogs = FrequenturinationLogs
                    FrequenturinationTapped = false
                }
                else if SpottingTapped{
                    destination.symptomtitle = "Symptom: Spotting"
                    destination.symptomLogs = SpottingLogs
                    SpottingTapped = false
                }
                else if FoodaversionTapped {
                    destination.symptomtitle = "Symptom: Food Aversion"
                    destination.symptomLogs = FoodaversionLogs
                    FoodaversionTapped = false
                }
                else if CravingsTapped {
                    destination.symptomtitle = "Symptom: Cravings"
                    destination.symptomLogs = CravingsLogs
                    CravingsTapped = false
                }
                else if BackpainTapped {
                    destination.symptomtitle = "Symptom: Back Pain"
                    destination.symptomLogs = BackpainLogs
                    BackpainTapped = false
                }
                
                destination.totalLogs = logs
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
    
    @IBAction func BloatingTapped(_ sender: Any) {
        BloatingTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    
    @IBAction func FatigueTapped(_ sender: Any) {
        FatigueTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    @IBAction func SwollenBreastsTapped(_ sender: Any) {
        SwollenbreastsTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    @IBAction func MorningSicknessTapped(_ sender: Any) {
        MorningsicknessTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    @IBAction func FrequentUrinationTapped(_ sender: Any) {
        FrequenturinationTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    @IBAction func SpottingTapped(_ sender: Any) {
        SpottingTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    @IBAction func FoodAversionTapped(_ sender: Any) {
        FoodaversionTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    @IBAction func CravingsTapped(_ sender: Any) {
        CravingsTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    @IBAction func BackPainTapped(_ sender: Any) {
        BackpainTapped = true;
        performSegue(withIdentifier: "ToSymptom", sender: nil)
    }
    

}
