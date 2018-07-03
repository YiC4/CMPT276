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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //download posts
        loadMealLogs()

    }
    
    //Loads Meal logs in TableView
    func loadMealLogs(){
        
        postsRef = Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("mealLog")

        postsRef.observe(.value, with: {
            (snapshot) in
            self.logs.removeAll()//remove to refresh
            for child in snapshot.children {
                let childSnapshot = child as! DataSnapshot
                let log = MealLog(snapshot: childSnapshot)
                self.logs.insert(log, at: 0)
                print(log.MealTitle)
            }
            print(self.logs)
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
        print("in here")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Log Cell", for: indexPath as IndexPath) as! LogCell
        let log = logs[indexPath.row]
        
        cell.mealLog = log
        
        return cell
    }

}
