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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func SignOut (_ sender: AnyObject) {
        try! Auth.auth().signOut()

        KeychainWrapper.standard.removeObject(forKey: "uid")

        dismiss(animated: true, completion: nil)
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
                
                
                print(log.MealTitle)
            }
            self.tableView.reloadData()
            print(self.logs)
            
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
        print("in here")
        let cell = tableView.dequeueReusableCell(withIdentifier:"Log Cell", for: indexPath as IndexPath) as! LogCell
        let log = logs[indexPath.row]
        
        cell.mealLog = log
        return cell
        
    }

}
