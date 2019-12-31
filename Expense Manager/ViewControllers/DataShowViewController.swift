//
//  DataShowViewController.swift
//  Expense Manager
//
//  Created by Md Sifat on 12/30/19.
//  Copyright © 2019 Md Sifat. All rights reserved.
//

import UIKit
import CoreData

class DataShowViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     var item: [NSManagedObject] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let name = item[indexPath.row].value(forKey: "name")
        let expense = item[indexPath.row].value(forKey: "expense")
        let expnseType = item[indexPath.row].value(forKey: "type") as! Bool
        cell.nameShowLbl.text = name as? String
        cell.expenaeShowLbl.text = expense as? String
        print(expnseType)
        if expnseType {
            cell.expenaeShowLbl.textColor = .green
        }else {
            cell.expenaeShowLbl.textColor = .red
        }
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "Expense")
        
        do {
            try item = context.fetch(request)
        } catch  {
            print(error)
        }
        tableView.reloadData()
    }



}
