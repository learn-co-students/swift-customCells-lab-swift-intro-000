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
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numbers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MathTableViewCell
        
        let aNumber = numbers[indexPath.row]
        
//        cell.firstNumberLabel.text? = String(describing: aNumber[0])
//        cell.secondNumberLabel.text? = String(describing: aNumber[1])
//        cell.thirdNumberLabel.text? = String(describing: aNumber[2])
//        cell.fourthNumberLabel.text? = String(describing: aNumber[3])

        cell.firstNumberLabel.text? = "\(aNumber[0])"
        cell.secondNumberLabel.text? = "\(aNumber[1])"
        cell.thirdNumberLabel.text? = "\(aNumber[2])"
        cell.fourthNumberLabel.text? = "\(aNumber[3])"
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != "mathSegue" { return }
        if let dest = segue.destination as? DisplayMathViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            dest.numbers = numbers[(indexPath as NSIndexPath).row]
        }
    }
    
    
    
}
