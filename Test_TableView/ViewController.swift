//
//  ViewController.swift
//  Test_TableView
//
//  Created by Wataru Inoue on 2018/01/06.
//  Copyright © 2018年 Wataru Inoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    var myArray = ["ああ", "いい", "ううう"]
    
    // 倉庫
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.dataSource = self
        
        ud.set("えええ", forKey: "KEY01")
        
        let arr : [String] = ["え", "お", "か"]
        ud.set(arr, forKey: "KEY02")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tableViewにいくつのcellを表示するのか
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    // それぞれcellに何を表示するのか
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = myArray[indexPath.row]
        
        return cell
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        
        let eeeText = ud.object(forKey: "KEY01") as! String
        
        myArray.append(eeeText)
        
        // tableViewの再表示
        myTableView.reloadData()
        
        
    }
    
    //
    @IBAction func tappedButton2(_ sender: UIButton) {
        
        let eokaArray = ud.array(forKey: "KEY02") as! [String]
        
//        myArray = myArray + eokaArray
        myArray += eokaArray
        
        // tableViewの再表示
        myTableView.reloadData()
        
    }
    

}

