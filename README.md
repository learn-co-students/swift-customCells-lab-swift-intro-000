# Custom UITableViewCell Lab

![Martin](http://i.imgur.com/8PU1o17.jpg?1)
 
> We must accept finite disappointment, but never lose infinite hope. ~[Martin Luther King, Jr.](https://en.wikipedia.org/wiki/Martin_Luther_King,_Jr.)

## Learning Objectives - The student should be able to..

* Complete this lab


## What the student can do at this point 

* Create variables and constants
* Is familiar with type annotations, type inference and string interpolation.
* Can create functions with return types.
* Is familiar with the String, Int, Double, and Bool type.
* Can perform arithmetic operations on Int and Double.
* Understands if and else clause statements.
* Can create and use Arrays.
* Can iterate over an Array using a for-in loop.
* Can iterate over an Array calling enumerate().
* Work with the following methods on arrays:
	* append()
	* insert(_:atIndex:)
	* removeAtIndex()
	* subscript syntax with arrays
	* count
	* isEmpty
* Can work with dictionaries 
* Can iterate over a dictionary
* Knows how to work with optionals
* Classes
* Structs
* Properties

## Outline / Notes

* They should be asked to create a custom `UITableViewCell`.
* First drag a Horizontal Stack View into the cell.
* Constrain the Stack View they just dragged into the cell to all edges of the Content View.
* I've included a completed xcode project which this lab could represent. I think it will be tough to ask them to re-create this entire thing from scratch.
* I think we provide to them the `generateData()` method, as well as the `randomNumberFromOneTo(_:)` method.
* It's on the student to create the custom `UITableViewCell` and lay it out properly in the Main.storyboard file using a stack view.
* Then they should be able to fill that tableView with its necessary data, the student will be required to fill out the following three methods:

```swift
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
```  

* The student should also be asked to complete the following method:

```swift
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destVC = segue.destinationViewController as! DisplayMathViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = numbers[indexPath.row]
            destVC.numbers = selectedRow
        }
        
    }
```

* I've included the DisplayMathViewController file. How i created this should be labeled as the advanced portion or something. I think the next piece of instructions (at this stage) to be presented to the student is something like this.
* Drag a new `UIViewController` in interface builder, this will be where we lay out our numbers and perform a math operation on them.

![Lab](http://i.imgur.com/pFvs73M.png)

* I'm cool with them creating a box like that, builing it with Stack Views and centering it in the screen. Then have them create the segue in Storyboard.
* Then have them implement the prepareForSegue method to pass along that chosen row (which represents an array of Ints)
* In the viewDidLoad of the newly made View Controller, it should update its labels with the info from the chosen row.
* Here, this is a win for the student if they can get this far. We can introduce more complicated instructions which could be labeled Advanced, Optional to have them create what it is I did in the xcode project I included in this repo. Obviously they won't be able to do it exactly how I did here but they might be able to hack something together if they so choose. My example doesn't work with division well considering I'm leaving it as an Int.
* This lab should include tests similar to this [lab](https://github.com/learn-co-curriculum/hella-cells)
* We should test this lab using [KIF](https://github.com/kif-framework/KIF/), here is that lab posted above [test file](https://github.com/learn-co-curriculum/hella-cells/blob/master/HellaCellsTests/FISViewSpec.m) as an example.





<a href='https://learn.co/lessons/CustomCellLab' data-visibility='hidden'>View this lesson on Learn.co</a>
