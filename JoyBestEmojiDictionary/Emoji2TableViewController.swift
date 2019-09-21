//
//  Emoji2TableViewController.swift
//  JoyBestEmojiDictionary
//
//  Created by JOY BEST on 9/20/19.
//  Copyright © 2019 JOY BEST. All rights reserved.
//

import UIKit

class Emoji2TableViewController: UITableViewController {
    
    var emojis: [Emoji] = [
    Emoji(symbol: "😃", name: "Grinning Face", description: "Grinning Face", usage: "happiness"),
    Emoji(symbol: "😐", name: "Confused Face", description: "A confused, puzzled face", usage: "unsure what to think; displeasure")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

  //  override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
    //  return 0
  //}


    
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
           return emojis.count
        } else {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = emojis[indexPath.row]
       //cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
   //cell.detailTextLabel?.text = emoji.description
        cell.update(with: emoji)
        cell.showsReorderControl = true
        // Configure the cell...
        
      return cell
    }
    //override func tableView(_ tableView:  UITableView, didSelectRowAt
      //  indexPath: IndexPath) {
     //   let emoji = emojis[indexPath.row]
      //  print("\(emoji.symbol) \(indexPath)")
   // }

    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
      override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
            // Delete the row from the data source
    //        tableView.deleteRows(at: [indexPath], with: .fade)
   //     } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  //      }
//    }
    

    
    //Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()

    }
 

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
    
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
    let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let navController = segue.destination as!
            UINavigationController
            let addEditEmojiTableViewController =
            navController.topViewController as!
            AddEditEmojiTableViewController
            
            addEditEmojiTableViewController.emoji = emoji
        }
    }
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as!
        AddEditEmojiTableViewController
        if let emoji = sourceViewController.emoji {
            if let selectedIndexPath =
                tableView.indexPathForSelectedRow {
                emojis[selectedIndexPath.row] = emoji
                tableView.reloadRows(at: [selectedIndexPath],
                                     with: .none)
            } else {
                let newIndexPath = IndexPath(row: emojis.count,
                                             section: 0)
                emojis.append(emoji)
                tableView.insertRows(at: [newIndexPath],
                                     with: .automatic)
            }
        }
        
        
}
}

