//
//  AddToDoViewController.swift
//  toDoList
//
//  Created by Diya Mahaveer on 8/2/22.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    @IBOutlet weak var titleTextField: UITextField!
    //You use text fields to gather text-based input from the user using the onscreen keyboard
    @IBOutlet weak var importantSwitch: UISwitch!
    //The UISwitch class declares a property and a method to control its on/off state.

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {

      // we have to grab this view context to be able to work with Core Data
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        // we are creating a new ToDoCD object here, naming it toDo
        let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)

        // if the titleTextField has text, we will call that text titleText
        if let titleText = titleTextField.text {
            // we will take the titleText and assign that value to toDo.name
            // this .name and .important came from the attributes you typed in on the Core Data page!
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }

        try? context.save()

        navigationController?.popViewController(animated: true)
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
