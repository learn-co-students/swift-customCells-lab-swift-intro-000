//
//  DisplayMathViewController.swift
//  CustomCellMath
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class DisplayMathViewController: UIViewController {
    
    var numbers: [Int] = []
    
    @IBOutlet weak var topLeftNumberLabel: UILabel!
    @IBOutlet weak var topRightNumberLabel: UILabel!
    @IBOutlet weak var bottomLeftNumberLabel: UILabel!
    @IBOutlet weak var bottomRightNumberLabel: UILabel!
    
    @IBOutlet weak var leftBottomLabel: UILabel!
    @IBOutlet weak var leftTopLabel: UILabel!
    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var topRightLabel: UILabel!
    @IBOutlet weak var rightTopLabel: UILabel!
    @IBOutlet weak var rightBottomLabel: UILabel!
    @IBOutlet weak var bottomLeftLabel: UILabel!
    @IBOutlet weak var bottomRightLabel: UILabel!
    
    @IBOutlet weak var operatorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        displayNumbersInCorrespondingLabels()
        
    }

    @IBAction func additionTapped(sender: AnyObject) {
        
        updateLabelsWithOperation(+)
        operatorLabel.text = "+"
        
    }
    
    @IBAction func subtractionTapped(sender: AnyObject) {
        
        updateLabelsWithOperation(-)
        operatorLabel.text = "-"
        
    }
    
    @IBAction func multiplicationTapped(sender: AnyObject) {
        
        updateLabelsWithOperation(*)
        operatorLabel.text = "x"
        
    }

    @IBAction func divisionTapped(sender: AnyObject) {
        
        updateLabelsWithOperation(/)
        operatorLabel.text = "/"
        
    }
    
    func displayNumbersInCorrespondingLabels() {
        
        let numberLabels = [
            topLeftNumberLabel,
            topRightNumberLabel,
            bottomLeftNumberLabel,
            bottomRightNumberLabel
        ]
        
        for (index, number) in numbers.enumerate() {
            let correspondingLabel = numberLabels[index]
            correspondingLabel.text = String(number)
        }
        
    }
    
    func updateLabelsWithOperation(operation: (Int, Int) -> Int) {
        
        let upperLeftNumber = numbers[0]
        let upperRightNumber = numbers[1]
        let lowerLeftNumber = numbers[2]
        let lowerRightNumber = numbers[3]
        
        bottomLeftLabel.text = String(operation(upperLeftNumber, lowerLeftNumber))
        bottomRightLabel.text = String(operation(upperRightNumber, lowerRightNumber))
        leftBottomLabel.text = String(operation(lowerRightNumber, lowerLeftNumber))
        leftTopLabel.text = String(operation(upperRightNumber, upperLeftNumber))
        topLeftLabel.text = String(operation(lowerLeftNumber, upperLeftNumber))
        topRightLabel.text = String(operation(lowerRightNumber, upperRightNumber))
        rightTopLabel.text = String(operation(upperLeftNumber, upperRightNumber))
        rightBottomLabel.text = String(operation(lowerLeftNumber, lowerRightNumber))
        
    }

}
