//
//  ILayoutGenerator.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/15/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import Foundation

protocol ILayoutGenerator{
    
    func checkInCol(num:Int, sudoku:[[Int]], n:Int) -> Bool
    func checkInRow(num:Int, row:[Int]) -> Bool
    func checkInBox(num:Int, sudoku:[[Int]], n:Int) -> Bool
    func getRow(sudoku: [[Int]]) -> [Int]
    func generateLayout() -> [[Int]]
    
}
