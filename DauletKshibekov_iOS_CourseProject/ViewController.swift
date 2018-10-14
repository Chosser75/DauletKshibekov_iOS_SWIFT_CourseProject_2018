//
//  ViewController.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/14/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var currentCell: UIButton?
    var cells = [[UIButton]]()
    var layout:[[Int]]!
    var layoutGenerator: LayoutGenerator!
    // time passed in seconds
    var secondsCount = 0
    var timer = Timer()
    var isTimerRunning = false
    // initial difficulty level
    public static var difficultyLvl = DifficultyLvl.beginner
    // if solution has been cheched
    var isChecked = false
    // if correct solution has been shown
    var isCorrectShown = false
    // instance of the class that saves and reads best results to/from a file
    let fileHelper = PersistHelper()
    // flags of choosen actions from the main menu
    public static var isCheckSolutionFromMenu = false
    public static var isShowCorrectSolutionFromMenu = false
    public static var isNewGameFromMenu = false
    public static var isExitFromMenu = false
    public static var isPlayMusicFromMenu = false
    
    var musicForSudoku: AVAudioPlayer?
    let DELIM = "*customDelimiter*"
    let fileNamePrefix = "records"
    let fileNameSuffix = ".rps"
    let fileNameSuffixToRead = "rps"
        
    enum DifficultyLvl: String {
        case beginner = "Beginner"
        case advanced = "Advanced"
        case master = "Master"
    }
    
    enum HowToAddRecord {
        case first
        case add
        case replace
        case none
    }
    
    @IBOutlet weak var btn1: UIButton!    
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn0: UIButton!
    
    @IBOutlet weak var cell00: UIButton!
    @IBOutlet weak var cell01: UIButton!
    @IBOutlet weak var cell02: UIButton!
    @IBOutlet weak var cell03: UIButton!
    @IBOutlet weak var cell04: UIButton!
    @IBOutlet weak var cell05: UIButton!
    @IBOutlet weak var cell06: UIButton!
    @IBOutlet weak var cell07: UIButton!
    @IBOutlet weak var cell08: UIButton!
    @IBOutlet weak var cell10: UIButton!
    @IBOutlet weak var cell11: UIButton!
    @IBOutlet weak var cell12: UIButton!
    @IBOutlet weak var cell13: UIButton!
    @IBOutlet weak var cell14: UIButton!
    @IBOutlet weak var cell15: UIButton!
    @IBOutlet weak var cell16: UIButton!
    @IBOutlet weak var cell17: UIButton!
    @IBOutlet weak var cell18: UIButton!
    @IBOutlet weak var cell20: UIButton!
    @IBOutlet weak var cell21: UIButton!
    @IBOutlet weak var cell22: UIButton!
    @IBOutlet weak var cell23: UIButton!
    @IBOutlet weak var cell24: UIButton!
    @IBOutlet weak var cell25: UIButton!
    @IBOutlet weak var cell26: UIButton!
    @IBOutlet weak var cell27: UIButton!
    @IBOutlet weak var cell28: UIButton!
    @IBOutlet weak var cell30: UIButton!
    @IBOutlet weak var cell31: UIButton!
    @IBOutlet weak var cell32: UIButton!
    @IBOutlet weak var cell33: UIButton!
    @IBOutlet weak var cell34: UIButton!
    @IBOutlet weak var cell35: UIButton!
    @IBOutlet weak var cell36: UIButton!
    @IBOutlet weak var cell37: UIButton!
    @IBOutlet weak var cell38: UIButton!
    @IBOutlet weak var cell40: UIButton!
    @IBOutlet weak var cell41: UIButton!
    @IBOutlet weak var cell42: UIButton!
    @IBOutlet weak var cell43: UIButton!
    @IBOutlet weak var cell44: UIButton!
    @IBOutlet weak var cell45: UIButton!
    @IBOutlet weak var cell46: UIButton!
    @IBOutlet weak var cell47: UIButton!
    @IBOutlet weak var cell48: UIButton!
    @IBOutlet weak var cell50: UIButton!
    @IBOutlet weak var cell51: UIButton!
    @IBOutlet weak var cell52: UIButton!
    @IBOutlet weak var cell53: UIButton!
    @IBOutlet weak var cell54: UIButton!
    @IBOutlet weak var cell55: UIButton!
    @IBOutlet weak var cell56: UIButton!
    @IBOutlet weak var cell57: UIButton!
    @IBOutlet weak var cell58: UIButton!
    @IBOutlet weak var cell60: UIButton!
    @IBOutlet weak var cell61: UIButton!
    @IBOutlet weak var cell62: UIButton!
    @IBOutlet weak var cell63: UIButton!
    @IBOutlet weak var cell64: UIButton!
    @IBOutlet weak var cell65: UIButton!
    @IBOutlet weak var cell66: UIButton!
    @IBOutlet weak var cell67: UIButton!
    @IBOutlet weak var cell68: UIButton!
    @IBOutlet weak var cell70: UIButton!
    @IBOutlet weak var cell71: UIButton!
    @IBOutlet weak var cell72: UIButton!
    @IBOutlet weak var cell73: UIButton!
    @IBOutlet weak var cell74: UIButton!
    @IBOutlet weak var cell75: UIButton!
    @IBOutlet weak var cell76: UIButton!
    @IBOutlet weak var cell77: UIButton!
    @IBOutlet weak var cell78: UIButton!
    @IBOutlet weak var cell80: UIButton!
    @IBOutlet weak var cell81: UIButton!
    @IBOutlet weak var cell82: UIButton!
    @IBOutlet weak var cell83: UIButton!
    @IBOutlet weak var cell84: UIButton!
    @IBOutlet weak var cell85: UIButton!
    @IBOutlet weak var cell86: UIButton!
    @IBOutlet weak var cell87: UIButton!
    @IBOutlet weak var cell88: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var difficultyLevel: UISegmentedControl!
    
    @IBAction func difficultyChanged(_ sender: UISegmentedControl) {
        switch (difficultyLevel.selectedSegmentIndex){
        case 0:
            ViewController.difficultyLvl = .beginner
        case 1:
            ViewController.difficultyLvl = .advanced
        case 2:
            ViewController.difficultyLvl = .master
        default:
            ViewController.difficultyLvl = .beginner
        }
        startNewGame()
    }
    
    @IBAction func checkSolutionBtnPressed(_ sender: UIButton) {
        handleSolution()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.layer.cornerRadius = 18
        btn2.layer.cornerRadius = 18
        btn3.layer.cornerRadius = 18
        btn4.layer.cornerRadius = 18
        btn5.layer.cornerRadius = 18
        btn6.layer.cornerRadius = 18
        btn7.layer.cornerRadius = 18
        btn8.layer.cornerRadius = 18
        btn9.layer.cornerRadius = 18
        btn0.layer.cornerRadius = 18
        
        cells = [[cell00, cell01, cell02, cell03, cell04, cell05, cell06, cell07, cell08],
                     [cell10, cell11, cell12, cell13, cell14, cell15, cell16, cell17, cell18],
                     [cell20, cell21, cell22, cell23, cell24, cell25, cell26, cell27, cell28],
                     [cell30, cell31, cell32, cell33, cell34, cell35, cell36, cell37, cell38],
                     [cell40, cell41, cell42, cell43, cell44, cell45, cell46, cell47, cell48],
                     [cell50, cell51, cell52, cell53, cell54, cell55, cell56, cell57, cell58],
                     [cell60, cell61, cell62, cell63, cell64, cell65, cell66, cell67, cell68],
                     [cell70, cell71, cell72, cell73, cell74, cell75, cell76, cell77, cell78],
                     [cell80, cell81, cell82, cell83, cell84, cell85, cell86, cell87, cell88]]
        layoutGenerator = LayoutGenerator()
        startNewGame()
        self.musicForSudoku = loadSound(name: "musicForSudoku")
    }
    
    func loadSound(name: String) -> AVAudioPlayer? {
        let bundle = Bundle.main
        let optionalPath = bundle.path(forResource: name, ofType: "m4a")
        if let path = optionalPath {
            let url = URL(fileURLWithPath: path)
            let optionalPlayer = try? AVAudioPlayer(contentsOf: url)
            if let player = optionalPlayer {
                player.prepareToPlay()
                print("\(name) loaded.")
                return player
            } else {
                print("Could not load \(name).")
                return nil
            }
        } else {
            print("Could not create path")
            return nil
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if ViewController.isCheckSolutionFromMenu == true {
            ViewController.isCheckSolutionFromMenu = false
            handleSolution()
        }
        if ViewController.isShowCorrectSolutionFromMenu == true {
            ViewController.isShowCorrectSolutionFromMenu = false
            showCorrectSolution()
        }
        if ViewController.isNewGameFromMenu == true {
            ViewController.isNewGameFromMenu = false
            startNewGame()
        }
        if ViewController.isPlayMusicFromMenu == true {
            if self.musicForSudoku?.isPlaying == false {
                self.musicForSudoku?.play()
            }
        } else {
            if self.musicForSudoku?.isPlaying == true {
                self.musicForSudoku?.pause()
            }
        }
        if ViewController.isExitFromMenu == true{
            exit(0);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // mark selected cell
    @IBAction func cellSelected(_ sender: UIButton) {
        for row in cells {
            for cell in row{
                if cell.backgroundColor != UIColor.white {
                    cell.backgroundColor = UIColor.white
                }
            }
        }
        sender.backgroundColor = UIColor.green
        currentCell = sender
    }
    
    // assign selected number to the selected cell (or clear it if 0 is selected)
    @IBAction func numberEntered(_ sender: UIButton) {
        if let cc = currentCell{
            if sender.tag == 0 {
                cc.setTitle("", for: .normal)
                cc.tag = sender.tag
            } else {
                cc.setTitle(String(sender.tag), for: .normal)
                cc.tag = sender.tag
            }            
        }
    }
    
    @IBAction func newGameBtn(_ sender: UIButton) {
        startNewGame()
    }
    
    func startNewGame(){
        var quantityOfNumsToHide: Int = 0
        switch (difficultyLevel.selectedSegmentIndex){
            case 0:
                quantityOfNumsToHide = 20
            case 1:
                quantityOfNumsToHide = 30
            case 2:
                quantityOfNumsToHide = 40
            default:
                quantityOfNumsToHide = 0
        }
        
        // choose which cells to hide
        let numsToHide = getNumbersToHide(quantity: quantityOfNumsToHide)
        // get new unique sudoku layout of numbers
        layout = layoutGenerator.generateLayout()
        // fill out cells
        var count = 0
        for i in 0..<9{
            for n in 0..<9{
                cells[i][n].setTitle("", for: .normal)
                cells[i][n].backgroundColor = UIColor.white
                cells[i][n].titleLabel?.font = UIFont.systemFont(ofSize: 20)
                cells[i][n].isUserInteractionEnabled = true
                // hide cell if it is in the number of those to be hidden
                if (!numsToHide.contains(count)){
                    cells[i][n].setTitle(String(layout[i][n]), for: .normal)
                    cells[i][n].tag = layout[i][n]
                    cells[i][n].titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                    cells[i][n].isUserInteractionEnabled = false
                }
               count += 1
            }
        }
        if isTimerRunning == true {
            timer.invalidate()
        }
        secondsCount = 0
        isChecked = false
        isCorrectShown = false
        runTimer()
    }
    
    // choose cells to hide
    private func getNumbersToHide(quantity: Int) -> [Int] {
        var numbersToHide = [Int]()
        for _ in 1...quantity {
            var n: Int
            repeat {
                n = Int(arc4random_uniform(UInt32(81)))
            } while numbersToHide.contains(n)
            numbersToHide.append(n)
        }
        return numbersToHide
    }
    
    func runTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        secondsCount += 1
        timerLabel.text = timeString(time: TimeInterval(secondsCount))
    }
    
    // returns formatted time has passed
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    
    func handleSolution(){
        if (isChecked == true || isCorrectShown == true) {
            return
        }
        if isTimerRunning == true {
            timer.invalidate()
            isTimerRunning = false
        }
        isChecked = true
        var title = ""
        var message = ""
        // if solution is correct
        if checkSolution() == true {
            let isRecResult = checkRecord()
            // if it is a new record (new best result)
            if isRecResult.isRecord == true {
                saveNewRecord(howToAddRecord: isRecResult.howToAddRecord)
            } else {
                title = "Congratulations!"
                message = "Your solution is correct.\n\nYour time is \(timeString(time: TimeInterval(secondsCount)))\nDifficulty level: \(ViewController.difficultyLvl.rawValue)\nGoog job!"
                showMessage(title: title, message: message)
            }
        } else {
            title = "Incorrect solution!"
            message = "Your solution is incorrect.\n\nYour time is \(timeString(time: TimeInterval(secondsCount)))\nDifficulty level: \(ViewController.difficultyLvl.rawValue)\nPlease try again."
            showMessage(title: title, message: message)
        }
    }
    
    func saveNewRecord(howToAddRecord: HowToAddRecord){
        var winName = ""
        var stringToFile = ""
        let fileNameToWrite = fileNamePrefix + ViewController.difficultyLvl.rawValue + fileNameSuffix
        let fileNameToRead = fileNamePrefix + ViewController.difficultyLvl.rawValue
        let alert = UIAlertController(title: "Congratulations with New Record!!!",
                                      message: "You established a new record!\n\nYour time is \(timeString(time: TimeInterval(secondsCount)))\nDifficulty level: \(ViewController.difficultyLvl.rawValue)\nPlease tell us your name:", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let name = alert.textFields?.first?.text {
                if name != ""{
                    winName = name
                } else {
                    winName = "Anonimous"
                }
            }
            stringToFile = "\(winName)\(self.DELIM)\(ViewController.difficultyLvl.rawValue)\(self.DELIM)\(self.secondsCount)\(self.DELIM)\(self.timeString(time: TimeInterval(self.secondsCount)))"
            switch (howToAddRecord){
                case .first:
                    self.fileHelper.writeFile(fileName: fileNameToWrite, fileContentToWrite: stringToFile)
                case .add:
                    var textToFile = self.fileHelper.readFile(fileName: fileNameToRead, fileExtension: self.fileNameSuffixToRead)
                    textToFile += "\n\(stringToFile)"
                    self.fileHelper.writeFile(fileName: fileNameToWrite, fileContentToWrite: textToFile)
                case .replace:
                    var sortedWinnersArray = self.fileHelper.getWinnersFromFile(fileName: fileNameToRead, fileExtension: self.fileNameSuffixToRead, delimiter: self.DELIM)
                    sortedWinnersArray.removeLast()
                    for winner in sortedWinnersArray{
                        stringToFile += "\n\(winner.name)\(self.DELIM)\(winner.difficulty)\(self.DELIM)\(winner.timeSeconds)\(self.DELIM)\(winner.timeFormatted)"
                    }
                    self.fileHelper.writeFile(fileName: fileNameToWrite, fileContentToWrite: stringToFile)
                case .none:
                    return
            }
        }))
        self.present(alert, animated: true)
    }
    
    // checks if it is a new record (best result)
    func checkRecord() -> (isRecord: Bool, howToAddRecord: HowToAddRecord) {
        var isRecord = false
        var howToAddRecord = HowToAddRecord.none
        var fileName = fileNamePrefix + ViewController.difficultyLvl.rawValue + fileNameSuffix
        if fileHelper.isFileExists(fileName: fileName) == false {
            isRecord = true
            howToAddRecord = .first
        } else {
            // Check how many records in the file
            fileName = fileNamePrefix + ViewController.difficultyLvl.rawValue
            let recordsString = fileHelper.readFile(fileName: fileName, fileExtension: self.fileNameSuffixToRead)
            let recordsArray = recordsString.components(separatedBy: "\n")
            if recordsArray.count < 10{
                isRecord = true
                howToAddRecord = HowToAddRecord.add
            } else {
                // Derive all times from records,
                // check if a current time is less than a maximum time from records
                var maxTime = 0
                for record in recordsArray{
                    let t = record.components(separatedBy: DELIM)
                    if Int(t[2])! > maxTime{
                        maxTime = Int(t[2])!
                    }
                }
                if secondsCount < maxTime {
                    isRecord = true
                    howToAddRecord = HowToAddRecord.replace
                }
            }
            
        }
        return (isRecord, howToAddRecord)
    }
    
    // checks if solution is correct
    func checkSolution()->Bool{
        var isCorrect = true
        for i in 0..<9{
            for n in 0..<9{
                if cells[i][n].tag != layout[i][n]{
                    isCorrect = false
                    cells[i][n].backgroundColor = UIColor.red
                }
            }
        }
        return isCorrect
    }
    
    func showMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // if user shakes iPhone
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        handleSolution()
    }
    
    func showCorrectSolution(){
        if isTimerRunning == true {
            timer.invalidate()
            isTimerRunning = false
        }
        isCorrectShown = true
        for i in 0..<9{
            for n in 0..<9{
                cells[i][n].setTitle("", for: .normal)
                cells[i][n].backgroundColor = UIColor.white
                cells[i][n].titleLabel?.font = UIFont.systemFont(ofSize: 20)
                cells[i][n].isUserInteractionEnabled = false
                cells[i][n].setTitle(String(layout[i][n]), for: .normal)
            }
        }
    }
    
    // for development use only
    func printWinnersToConsole(difficulty: String){
        let recordsString = fileHelper.readFile(fileName: fileNamePrefix + difficulty, fileExtension: fileNameSuffixToRead)
        print (recordsString)
        print(recordsString.components(separatedBy: "\n").count)
    }
}

