//
//  CompleteToDoViewController.swift
//  toDoList
//
//  Created by Diya Mahaveer on 8/15/22.
//

import UIKit


class CompleteToDoViewController: UIViewController {
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo?.name

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func completeTapped(_ sender: Any){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let theToDo = selectedToDo{
                context.delete(theToDo)
                navigationController?.popViewController(animated: true)
            }
        }
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
