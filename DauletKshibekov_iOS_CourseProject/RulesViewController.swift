//
//  RulesViewController.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/17/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import UIKit

// retrieves from internet and shows information about rules of the game
class RulesViewController: UIViewController {

    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let appDel = UIApplication.shared.delegate as? AppDelegate {
            rulesLabel.text = appDel.dataFetcher!.rulesString
            sourceLabel.text = "\n\nSource: \(appDel.dataFetcher!.url)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
