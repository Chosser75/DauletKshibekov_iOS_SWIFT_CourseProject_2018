//
//  IPersistant.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/16/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import Foundation

protocol IPersistant {
    func isFileExists(fileName: String) -> Bool
    func writeFile(fileName: String, fileContentToWrite: String)
    func readFile(fileName: String, fileExtension: String) -> String
}
