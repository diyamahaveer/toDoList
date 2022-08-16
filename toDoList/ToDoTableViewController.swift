//
//  ToDoTableViewController.swift
//  toDoList
//
//  Created by Diya Mahaveer on 8/2/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDoCD] = []
    //toDos property
    //we declared the type which is an array
    //it holds the returned ToDos

    override func viewDidLoad() {
        //super.viewDidLoad()
        getToDos()
        
        
    }
    
  /*  func createToDos() -> [ToDo]{
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
   */
    
    func getToDos() {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
            if let theToDos = coreDataToDos {
                toDos = theToDos
                tableView.reloadData()
            }
        }
      }
    }
    
    override func viewWillAppear(_ animated: Bool) {
      getToDos()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return toDos.count
        //this means that the table view controller will have more cells based on the number of todos
    }
    
   

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

      let toDo = toDos[indexPath.row]

      if let name = toDo.name {
        if toDo.important {
            cell.textLabel?.text = "❗️" + name
        } else {
            cell.textLabel?.text = toDo.name
        }
      }

      return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let toDo = toDos[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousVC = self
      }

      if let completeVC = segue.destination as? CompleteToDoViewController {
        if let toDo = sender as? ToDoCD {
          completeVC.selectedToDo = toDo
          completeVC.previousVC = self
        }
      }
    }
    

}
