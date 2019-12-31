//
//  HomeViewController.swift
//  Expense Manager
//
//  Created by Md Sifat on 12/30/19.
//  Copyright © 2019 Md Sifat. All rights reserved.
//

import UIKit
import CoreData
 
class HomeViewController: UIViewController {
    
    var isCheck : Bool = true
    @IBOutlet weak var nameTextFIeld: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var expenseTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        saveBtn.designButton(borderWidth: 0.5, borderColor: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
    }
    
    @IBAction func onClickSegmentController(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            isCheck = true
        }else {
            isCheck = false
        }
        print("Select: \(isCheck)")
    }
   
    @IBAction func onClickSave(_ sender: Any) {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Expense", in: context)
        let expense = NSManagedObject(entity: entity!, insertInto: context)
        print(isCheck)
        expense.setValue(nameTextFIeld.text, forKey: "name")
        expense.setValue(expenseTextField.text, forKey: "expense")
        expense.setValue(isCheck, forKey: "type")
        do {
            try context.save()
            let alert = UIAlertController(title: "✓", message: "Data Saved Successfully", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)

            // change to desired number of seconds (in this case 5 seconds)
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when){
              // your code with delay
              alert.dismiss(animated: true, completion: nil)
            }
        } catch  {
            print(error)
            
           
        }
        self.viewDidAppear(true)
        nameTextFIeld.text = ""
        expenseTextField.text = ""
        
        self.viewWillAppear(true)
       
    }
    
    
    

}


