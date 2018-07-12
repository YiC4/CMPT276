//
//  SymptomVC.swift
//  CMPT276App
//
//  Created by Michael Lee on 2018-07-09.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit

class SymptomVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var SymptomTitle: UILabel!
    @IBOutlet weak var TotalLogs: UILabel!
    @IBOutlet weak var TimesLogged: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        SymptomTitle.text = symptomtitle
        TotalLogs.text = "Total Logs: " + String(totalLogs.count)
        TimesLogged.text = "Times Symptom logged: " + String(symptomLogs.count)
        
        tableView.reloadData()
        // Do any additional setup after loading the view.
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
        print("in here")
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
    @IBAction func backtograph(_ sender: Any) {
        performSegue(withIdentifier: "tojourneygraph", sender: nil)
    }
    

}
