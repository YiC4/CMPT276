//
//  JourneyVC.swift
//  P
//
//  Created by Lcy on 2018/7/2.
//  Copyright © 2018年 Lcy. All rights reserved.
//
//  Usage: Populates With Meal Logs

import UIKit
import FirebaseAuth
import Firebase
import SwiftKeychainWrapper


class JourneyVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var postsRef: DatabaseReference! //Database reference
    var logs = [MealLog]()           //List of all mealogs
    var BloatingLogs = [MealLog]()
    var FatigueLogs = [MealLog]()
    var SwollenbreastsLogs = [MealLog]()
    var MorningsicknessLogs = [MealLog]()
    var FrequenturinationLogs = [MealLog]()
    var SpottingLogs = [MealLog]()
    var FoodaversionLogs = [MealLog]()
    var CravingsLogs = [MealLog]()
    var BackpainLogs = [MealLog]()
    
    @IBOutlet weak var tableView: UITableView! //Table View which is populated by meal logs
    
    var keyArray:[String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Perform segment to journey graph
    @IBAction func ToJourneyGraph(_ sender: Any) {
        performSegue(withIdentifier: "toJourneyGraph", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadMealLogs()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toJourneyGraph" {
            if let destination = segue.destination as? JourneyGraphVC {
                destination.logs = logs
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
    
    //Loads Meal logs in TableView
    func loadMealLogs(){
        
        postsRef = Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("mealLog")
        
        postsRef.observe(.value, with: {
            (snapshot) in
            self.logs.removeAll()//remove to refresh
            //print(snapshot)
            for child in snapshot.children {
                let childSnapshot = child as! DataSnapshot
                let log = MealLog(snapshot: childSnapshot)
                self.logs.insert(log, at: 0)
                
                if(log.Bloating){
                    self.BloatingLogs.insert(log, at: 0)
                }
                if(log.Fatigue){
                    self.FatigueLogs.insert(log, at: 0)
                }
                
                if(log.Swollenbreasts){
                    self.SwollenbreastsLogs.insert(log, at: 0)
                }
                
                if(log.Morningsickness){
                    self.MorningsicknessLogs.insert(log, at: 0)
                }
                
                if(log.Frequenturination){
                    self.FrequenturinationLogs.insert(log, at: 0)
                }
                
                if(log.Spotting){
                    self.SpottingLogs.insert(log, at: 0)
                }
                
                if(log.Foodaversion){
                    self.FoodaversionLogs.insert(log, at: 0)
                }
                
                if(log.Cravings){
                    self.CravingsLogs.insert(log, at: 0)
                }
                
                if(log.Backpain){
                    self.BackpainLogs.insert(log, at: 0)
                }
            }
            self.tableView.reloadData()
            
        })
        tableView.reloadData()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Log Cell", for: indexPath as IndexPath) as! LogCell
        
        cell.mealLog = logs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func getAllKeys() {
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("mealLog").observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                self.keyArray.append(key)
                self.keyArray.reverse()
            }
        })
    }
    
    //delete meal logs
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            getAllKeys()
            let when = DispatchTime.now() + 0.5
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("mealLog").child(self.keyArray[indexPath.row]).removeValue()
                self.logs.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.keyArray = []
            })
        }
    }
    
    
    //Pass data to DetailVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DvC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        DvC.getMeatTitle = logs[indexPath.row].MealTitle
        DvC.getDate = logs[indexPath.row].Date
        DvC.getTrimester = logs[indexPath.row].Trimester
        
        if logs[indexPath.row].Bloating == true { DvC.getSymptoms = DvC.getSymptoms + "Bloating\n"}
        if logs[indexPath.row].Fatigue == true { DvC.getSymptoms = DvC.getSymptoms + "Fatigue\n"}
        if logs[indexPath.row].Swollenbreasts == true { DvC.getSymptoms = DvC.getSymptoms + "Swollenbreasts\n"}
        if logs[indexPath.row].Morningsickness == true { DvC.getSymptoms = DvC.getSymptoms + "Morningsickness\n"}
        if logs[indexPath.row].Frequenturination == true { DvC.getSymptoms = DvC.getSymptoms + "Frequenturination\n"}
        if logs[indexPath.row].Moodswings == true { DvC.getSymptoms = DvC.getSymptoms + "Moodswings\n"}
        if logs[indexPath.row].Spotting == true { DvC.getSymptoms = DvC.getSymptoms + "Spotting\n"}
        if logs[indexPath.row].Foodaversion == true { DvC.getSymptoms = DvC.getSymptoms + "Foodaversion\n"}
        if logs[indexPath.row].Cravings == true { DvC.getSymptoms = DvC.getSymptoms + "Cravings\n"}
        if logs[indexPath.row].Backpain == true { DvC.getSymptoms = DvC.getSymptoms + "Backpain\n"}
        
        
        //Download image through URL
        let urlKey = logs[indexPath.row].MealImg
        
        if let url = URL(string: urlKey!){
            do {
                let data = try Data(contentsOf: url)
                DvC.getImage = UIImage(data: data)!
            }catch {
                print(" Error ")
            }
        }
        
        
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
