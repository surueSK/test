//
//  SettingTableViewController.swift
//  ADLogger_v2
//
//  Created by 助川友理 on 2020/08/08.
//  Copyright © 2020 助川友理. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    @IBOutlet weak var TimerColor: UISwitch!
    @IBOutlet weak var TClabel:UILabel!
    let userDefaults = UserDefaults.standard
    @IBAction func TCChanged(_ sender: UISwitch) {
        
        if sender.isOn{
            ViewController().timerHour.textColor = UIColor.white
            ViewController().timerMinute.textColor = UIColor.white
            ViewController().timerSecond.textColor = UIColor.white
            self.TClabel.text = "タイマー文字透明化 (ON)"
            userDefaults.set(true, forKey: "TCValue")
        }else{
            ViewController().timerHour.textColor = UIColor.black
            ViewController().timerMinute.textColor = UIColor.black
            ViewController().timerSecond.textColor = UIColor.black
            self.TClabel.text = "タイマー文字透明化 (OFF)"
            userDefaults.set(false, forKey: "TCValue")
        }
        //ViewController().timerHour.textColor = sender.isOn ? UIColor.blue : UIColor.blue
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let switchBool = userDefaults.bool(forKey: "TCValue")
        TimerColor.setOn(switchBool, animated: false)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
