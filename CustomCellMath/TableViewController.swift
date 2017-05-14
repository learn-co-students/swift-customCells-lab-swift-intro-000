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
    let reusableIdentifier = "NumberCell"
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! MathTableViewCell
        let numberList = numbers[indexPath.row]
        cell.firstNumberLabel.text = "\(numberList[0])"
        cell.secondNumberLabel.text = "\(numberList[1])"
        cell.thirdNumberLabel.text = "\(numberList[2])"
        cell.fourthNumberLabel.text = "\(numberList[3])"
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowMathView" else { return }
        guard let destination = segue.destination as? DisplayMathViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let numberList = numbers[indexPath.row]
        destination.numbers = numberList
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
