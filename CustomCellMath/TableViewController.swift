//
//  TableViewController.swift
//  CustomCellMath
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // an array of arrays
    // i.e. [[1, 2, 3, 4], [5, 3, 1, 0], [5, 2, 6, 6]]
    var numbers: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
    }
    

}



// MARK: - Generating an array of Data
extension TableViewController {
    
    func generateData() {
        for _ in 1...100 {
            var newNumberRow: [Int] = []
            
            for _ in 1...4 {
                let randomNumber = randomNumberFromOneTo(50)
                newNumberRow.append(randomNumber)
            }
            
            numbers.append(newNumberRow)
        }
    }
    
    func randomNumberFromOneTo(_ number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)) + 1)
    }
    
    //ADDED FUNCTIONS
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mathCell", for: indexPath) as! MathTableViewCell
        //downcast UITableViewCell to MathTableViewCell
        
        let currentRowOfNumbers = numbers[indexPath.row]
        
        let firstNumber = currentRowOfNumbers[0]
        let secondNumber = currentRowOfNumbers[1]
        let thirdNumber = currentRowOfNumbers[2]
        let fourthNumber = currentRowOfNumbers[3]
        
        cell.firstPLabel.text = String(firstNumber)
        cell.secondPLabel.text = String(secondNumber)
        cell.thirdPLabel.text = String(thirdNumber)
        cell.fourthPLabel.text = String(fourthNumber)
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! DisplayMathViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = numbers[indexPath.row]
            destVC.numbers = selectedRow
        }
        
    }
    
}



