//
//  DataFetcher.swift
//  GetTextFromWeb
//
//  Created by Daulet Kshibekov on 5/17/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import Foundation

// retrieves and stores information from web
class DataFetcher {
    
    let url: String
    var rulesString = ""
    
    init?(url: String) {
        self.url = url
        if let fetcherURL = URL(string: url) {
            let sharedSession: URLSession = URLSession.shared
            let dataTask: URLSessionDataTask = sharedSession.dataTask(with: fetcherURL, completionHandler: responseHandler)
            dataTask.resume()
        }   else {
            reportFailure(message: "Could not create URL from string '\(url)'")
            return nil
        }
    }
    
    func reportFailure(message: String) {
        print(message)
    }
    
    func responseHandler(data: Data?, response: URLResponse?, error: Error?){
        if let receivedError = error {
            reportFailure(message: receivedError.localizedDescription)
        } else if let receivedData = data {
            handleReceivedData(data: receivedData)
        }
    }
    
    func handleReceivedData(data: Data) {
        rulesString = ("\(String(data: data, encoding:.utf8) ?? "No data")")
        let recordsArray = rulesString.components(separatedBy: "\n")
        rulesString = ""
        var isRules = false
        for line in recordsArray {
            if line.contains("Sudoku — Dragon Adventure starts by teaching you the easiest rule of"){
                break
            }
            if isRules == true && line != "\n" && line != "" {
                rulesString += line.replacingOccurrences(of: "\n", with: " ")
            }
            if line.contains("Start with No Sub-Grids"){
                isRules = true
            }
        }
        rulesString = rulesString.trimmingCharacters(in: .whitespacesAndNewlines)
        rulesString = rulesString.replacingOccurrences(of: "\r", with: "")
    }

}
