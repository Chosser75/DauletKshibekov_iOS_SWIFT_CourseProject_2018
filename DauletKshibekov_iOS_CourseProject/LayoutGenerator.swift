//
//  LayoutGenerator.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/15/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import Foundation

// generates and returns new unique layout of numbers for Sudoku
class LayoutGenerator: ILayoutGenerator {
    
    // checks if the number matches another number in the col
    func checkInCol(num:Int, sudoku:[[Int]], n:Int) -> Bool {
        if (!sudoku.isEmpty) {
            for s in sudoku {
                if (!s.isEmpty){
                    if (num == s[n]){
                        return true
                    }
                }
            }
        }
        return false
    }
    
    // checks if the number matches another number in the row
    func checkInRow(num:Int, row:[Int]) -> Bool {
        if (!row.isEmpty){
            if (row.contains(num)){
                return true
            }
        }
        return false
    }
    
    // checks if the number matches another number in the 3x3 box
    func checkInBox(num:Int, sudoku:[[Int]], n:Int) -> Bool {
        if (sudoku.isEmpty || sudoku.count == 3 || sudoku.count == 6){
            return false
        }
        // get numbers in sudocu to check
        var r1 = 0
        var r2 = 0
        var numbersInBox = [Int]()
        // left box
        if (n < 3){
            r1 = 0
            r2 = 3
            // middle box
        } else if ((n > 2) && (n < 6)){
            r1 = 3
            r2 = 6
            // right box
        } else if (n > 5){
            r1 = 6
            r2 = 9
        }
        // upper three boxes
        if ((sudoku.count > 0) && (sudoku.count < 3)){
            for s in sudoku{
                for i in r1..<r2{
                    if (!s.isEmpty){
                        numbersInBox.append(s[i])
                    }
                }
            }
        }
        // num is in 5th line
        if (sudoku.count == 4){
            for i in r1..<r2{
                if (!sudoku[3].isEmpty){
                    numbersInBox.append(sudoku[3][i])
                }
            }
        }
        // num is in 6th line
        if (sudoku.count == 5){
            for i in r1..<r2{
                if (!sudoku[3].isEmpty){
                    numbersInBox.append(sudoku[3][i])
                }
                if (!sudoku[4].isEmpty){
                    numbersInBox.append(sudoku[4][i])
                }
            }
        }
        // num is in 8th line
        if (sudoku.count == 7){
            for i in r1..<r2{
                if (!sudoku[6].isEmpty){
                    numbersInBox.append(sudoku[6][i])
                }
            }
        }
        // num is in 9th line
        if (sudoku.count == 8){
            for i in r1..<r2{
                if (!sudoku[6].isEmpty){
                    numbersInBox.append(sudoku[6][i])
                }
                if (!sudoku[7].isEmpty){
                    numbersInBox.append(sudoku[7][i])
                }
            }
        }
        if (numbersInBox.contains(num)){
            return true
        }
        return false
    }
    
    // generates a row
    func getRow(sudoku: [[Int]]) -> [Int]{
        var attempts = 0
        var row = [Int]()
        while (row.isEmpty){
            attempts += 1
            // if no variants
            if (attempts == 6){
                row = []
                return row
            }
            // when a match is found
            var isNotValid = false
            var num = 0
            var numList = [Int]()
            for n in 0..<9 { // n is an index of a column
                numList = [1, 2, 3, 4, 5, 6, 7, 8, 9]
                num = numList.remove(at: Int(arc4random_uniform(UInt32(numList.count))))
                // if there is a match with another number in a row, column or 3x3 box
                while (checkInRow(num: num, row: row) || checkInCol(num: num, sudoku: sudoku, n: n) || checkInBox(num: num, sudoku: sudoku, n: n)){
                    // if a whole row  is incorrect (no of 1-9 numbers are fit)
                    if (numList.isEmpty){
                        isNotValid = true
                    } else{
                        num = numList.remove(at: Int(arc4random_uniform(UInt32(numList.count))))
                    }
                    if (isNotValid){
                        break
                    }
                }
                if (isNotValid){
                    row = []
                    break
                }
                row.append(num)
            }
        }
        return row
    }
    
    func generateLayout() -> [[Int]]{
        var sudoku = [[Int]]()
        var row = [Int]()
        while (row.isEmpty){
            for _ in 0..<9 { // i is the number of the row
                row = getRow(sudoku: sudoku)
                if (row.isEmpty){
                    sudoku = []
                    break
                }
                sudoku.append(row)
            }
        }
        return sudoku
    }
}
