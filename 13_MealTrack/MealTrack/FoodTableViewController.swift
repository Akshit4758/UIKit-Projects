//
//  FoodTableViewController.swift
//  MealTrack
//
//  Created by Akshit Goyal on 18/08/25.
//

import UIKit


class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] = [
        Meal(name: "Breakfast" , food: [
            Food(name: "Masala Dosa", description: "Crispy rice crepe filled with spiced potatoes, served with chutney and sambar."),
            Food(name: "Aloo Paratha", description: "Stuffed potato flatbread, pan-fried and served with butter and yogurt."),
            Food(name: "Poha", description: "Flattened rice cooked with spices, peanuts, and garnished with lemon.")
        ]),
        
        Meal(name: "Lunch" , food: [
            Food(name: "Paneer Butter Masala with Naan", description: "Soft paneer in creamy tomato gravy, served with butter naan."),
            Food(name: "Chicken Biryani", description: "Spiced chicken cooked with fragrant basmati rice and saffron."),
            Food(name: "Chole Bhature", description: "Spicy chickpea curry with deep-fried fluffy bread.")
        ]),
        
        Meal(name: "Dinner" , food: [
            Food(name: "Dal Tadka with Jeera Rice", description: "Yellow lentils tempered with spices, served with cumin rice."),
            Food(name: "Butter Chicken with Garlic Naan", description: "Creamy tomato chicken curry served with garlic naan."),
            Food(name: "Vegetable Pulao with Raita", description: "Spiced rice with veggies, served with cooling yogurt raita.")
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        
        
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(meals[indexPath.section].food[indexPath.row].name)"
        content.secondaryText = "\(meals[indexPath.section].food[indexPath.row].description)"
        
        cell.contentConfiguration = content
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(meals[section].name)"
    }

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
