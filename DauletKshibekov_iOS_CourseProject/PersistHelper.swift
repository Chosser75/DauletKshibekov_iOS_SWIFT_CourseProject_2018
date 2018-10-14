//
//  PersistHelper.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/16/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import Foundation

struct PersistHelper: IPersistant {
    
    func isFileExists(fileName: String) -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(fileName) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                return true
            } else {
                // FILE NOT AVAILABLE
                return false
            }
        } else {
            // FILE PATH NOT AVAILABLE
            return false
        }
    }
    
    func writeFile(fileName: String, fileContentToWrite: String){
        var filePath = ""
        // Fine documents directory on device
        let dirs:[String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        if dirs.count > 0 {
            let dir = dirs[0] //documents directory
            filePath = dir.appending("/" + fileName)
        } else {
            print("Could not find local directory to store file")
            return
        }
        do {
            // Write contents to file
            try fileContentToWrite.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print("An error took place: \(error)")
        }
    }
    
    func readFile(fileName: String, fileExtension: String) -> String {
        var inString = ""
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        // If the directory was found
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension(fileExtension) {
            do {
                inString = try String(contentsOf: fileURL)
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
        }
        return inString
    }

    func getWinnersFromFile(fileName: String, fileExtension: String, delimiter: String) -> [Winner]{
        var winnersArray = [Winner]()
        let recordsString = readFile(fileName: fileName, fileExtension: fileExtension)
        let recordsArray = recordsString.components(separatedBy: "\n")
        for record in recordsArray{
            let winnerStringArray = record.components(separatedBy: delimiter)
            winnersArray.append(Winner(name: winnerStringArray[0], difficulty: winnerStringArray[1], timeSeconds: Int(winnerStringArray[2])!, timeFormatted: winnerStringArray[3]))
        }
        return winnersArray.sorted(by: { $0.timeSeconds < $1.timeSeconds })
    }
}
