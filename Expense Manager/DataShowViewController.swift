//
//  DataShowViewController.swift
//  Expense Manager
//
//  Created by Md Sifat on 12/30/19.
//  Copyright © 2019 Md Sifat. All rights reserved.
//

import UIKit

class DataShowViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let name = item[indexPath.row].value(forKey: "name")
        let expense = item[indexPath.row].value(forKey: "expense")
        cell.nameShowLbl.text = name as! String
        cell.expenaeShowLbl.text = expense as! String
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.reloadData()
    }
    



}
