//
//  BestResultsTableViewController.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/15/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import UIKit

// shows best results for a current difficulty level
class BestResultsTableViewController: UITableViewController {
    let fileHelper = PersistHelper()
    var winnersArray = [Winner]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fileName = "records\(ViewController.difficultyLvl.rawValue)"
        if fileHelper.isFileExists(fileName: fileName + ".rps") == true {
            winnersArray = fileHelper.getWinnersFromFile(fileName: fileName, fileExtension: "rps", delimiter: "*customDelimiter*")
        } else {
            closeThis()
            let alert = UIAlertController(title: "No Records to show", message: "There are no results for the difficulty level \(ViewController.difficultyLvl.rawValue) yet", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return winnersArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)

        cell.textLabel?.text = String(indexPath.item + 1) + ". " + winnersArray[indexPath.item].name + " " + winnersArray[indexPath.item].timeFormatted

        return cell
    }
    
    func closeThis(){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}
