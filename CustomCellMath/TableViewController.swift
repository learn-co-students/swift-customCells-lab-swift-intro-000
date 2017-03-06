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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(numbers.count)")
        return numbers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mathCell", for: indexPath) as! MathTableViewCell
        let row = numbers[(indexPath as NSIndexPath).row]
     //   let animal = animals[(indexPath as NSIndexPath).row]
        
        cell.firstNumberLabel.text? = String(row[0])
        print("\(row))")
        cell.secondNumberLabel.text? = String(row[1])
        cell.thirdNumberLabel.text? = String(row[2])
        cell.fourthNumberLabel.text? = String(row[3])
        
        
        return cell
    }

    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "JJJ" { return }
        if let dest = segue.destination as? DisplayMathViewController {
           if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = numbers[indexPath.row]
            dest.numbers = selectedRow
            print("\(dest.numbers)")
        }
        }
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
    
    
}
