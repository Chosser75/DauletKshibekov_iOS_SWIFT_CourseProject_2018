//
//  MainMenuViewController.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/15/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
//    public static var isForClose = false
    
    @IBAction func checkSolutionBtn(_ sender: UIButton) {
        ViewController.isCheckSolutionFromMenu = true
        closeThis()
    }
    
    @IBAction func showSolutionBtn(_ sender: UIButton) {
        ViewController.isShowCorrectSolutionFromMenu = true
        closeThis()
    }
    
    @IBAction func newGameBtn(_ sender: UIButton) {
        ViewController.isNewGameFromMenu = true
        closeThis()
    }
    
    @IBAction func showBestRsultsBtn(_ sender: UIButton) {
//        MainMenuViewController.isForClose = true
    }
    
    @IBAction func exitBtn(_ sender: UIButton) {
        ViewController.isExitFromMenu = true
        closeThis()
    }
    
    @IBAction func SoundBtn(_ sender: UIButton) {
        if ViewController.isPlayMusicFromMenu == false {
            ViewController.isPlayMusicFromMenu = true
        } else {
            ViewController.isPlayMusicFromMenu = false
        }
        closeThis()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        if MainMenuViewController.isForClose == true{
//            MainMenuViewController.isForClose = false
//            closeThis()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeThis(){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
