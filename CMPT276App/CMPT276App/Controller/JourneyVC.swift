//
//  JourneyVC.swift
//  P
//
//  Created by Lcy on 2018/7/2.
//  Copyright © 2018年 Lcy. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftKeychainWrapper


class JourneyVC: UIViewController{

    var postsRef: DatabaseReference!
    var logs = [MealLog]()
    var selectedPost: MealLog!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    ///
    ///
    ///
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //download posts
        loadMealLogs()

    }

    func loadMealLogs(){

        postsRef = Database.database().reference().child("users").child("Melissa").child("mealLog")

        postsRef.observe(.value, with: {
            (snapshot) in
            self.logs.removeAll()//remove to refresh
            //print(snapshot)
            for child in snapshot.children {
                let childSnapshot = child as! DataSnapshot
                let log = MealLog(snapshot: childSnapshot)
                self.logs.insert(log, at: 0)
                print(log.MealTitle)
            }
            self.tableView.reloadData()
            print(self.logs)
           
        })

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("in here")
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogCell", for: indexPath as IndexPath) as! LogCell
        let log = logs[indexPath.row]

        cell.mealLog = log

        return cell
    }

}
