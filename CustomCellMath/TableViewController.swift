//
//  TableViewController.swift
//  CustomCellMath
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    @IBOutlet var tableViewNumbers: UITableView!
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
        return numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mathCell = tableView.dequeueReusableCell(withIdentifier: "mathCell", for: indexPath) as! MathTableViewCell
        
        let cellNums = numbers[indexPath.row]
        
        mathCell.firstNumberLabel.text = String(cellNums[0])
        mathCell.secondNumberLabel.text = String(cellNums[1])
        mathCell.thirdNumberLabel.text = String(cellNums[2])
        mathCell.fourthNumberLabel.text = String(cellNums[3])
        
        return mathCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "displayMathVC" else {
            return
        }
        
        if let dest = segue.destination as? DisplayMathViewController {
            if let selectedNumbers = tableViewNumbers.indexPathForSelectedRow {
                
                dest.numbers = numbers[selectedNumbers.row]
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
