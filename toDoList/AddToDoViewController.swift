//
//  AddToDoViewController.swift
//  toDoList
//
//  Created by Diya Mahaveer on 8/2/22.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    //You use text fields to gather text-based input from the user using the onscreen keyboard
    @IBOutlet weak var importantSwitch: UISwitch!
    //The UISwitch class declares a property and a method to control its on/off state.

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any){
        
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
