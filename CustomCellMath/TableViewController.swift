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
    
    let reuseIdentifier = "mathCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
    }
    
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
    
    func randomNumberFromOneTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)) + 1)
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MathTableViewCell
        
        let currentRowOfNumbers = numbers[indexPath.row]
        
        let firstNumber = currentRowOfNumbers[0]
        let secondNumber = currentRowOfNumbers[1]
        let thirdNumber = currentRowOfNumbers[2]
        let fourthNumber = currentRowOfNumbers[3]
        
        cell.firstNumberLabel.text = String(firstNumber)
        cell.secondNumberLabel.text = String(secondNumber)
        cell.thirdNumberLabel.text = String(thirdNumber)
        cell.fourthNumberLabel.text = String(fourthNumber)
        
        return cell
    }
 

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destVC = segue.destinationViewController as! DisplayMathViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = numbers[indexPath.row]
            destVC.numbers = selectedRow
        }
        
    }

}
