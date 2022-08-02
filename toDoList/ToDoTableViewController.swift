//
//  ToDoTableViewController.swift
//  toDoList
//
//  Created by Diya Mahaveer on 8/2/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDo] = []
    //toDos property
    //we declared the type which is an array
    //it holds the returned ToDos

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDos()
    }
    
    func createToDos() -> [ToDo]{
        //this is saying we are returning an array
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        //we are setting learning swift to be marked as important
        
        let dog = ToDo()
        dog.name = "walk the dog"
        //no need to set important because it's default is false
        
        return [swift, dog]
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return toDos.count
        //this means that the table view controller will have more cells based on the number of todos
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        //setting up view controller so the toDo will go in the cell
        
        if toDo.important{
            cell.textLabel?.text = "❗" + toDo.name
        } else{
            cell.textLabel?.text = toDo.name
        }
        
        //explains what the cell should do depending on the importance

        // Configure the cell...

        return cell
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
