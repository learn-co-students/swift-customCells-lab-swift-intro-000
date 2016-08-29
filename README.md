# Custom UITableViewCell Lab

![Martin](http://i.imgur.com/8PU1o17.jpg?1)
 
> We must accept finite disappointment, but never lose infinite hope. -[Martin Luther King, Jr.](https://en.wikipedia.org/wiki/Martin_Luther_King,_Jr.)

## Overview

In this lab, you'll lay out your own custom cells in an iOS app.

## Instructions

In this lab, you are going to implement a table view-backed app. Each row (or cell) of the table view will display four numbers. Tapping on a cell will take you to another view, where you can select various math operations (addition, subtraction, multiplication, and division) and see the results of those operations on the numbers.

Here's what the initial view of your app should look like:

![CustomCellMath: Main (table) view](https://s3.amazonaws.com/learn-verified/customcellmath-main.png)

And here's an example of a detailed view:

![CustomCellMath: Detail view](https://s3.amazonaws.com/learn-verified/customcellmath-detail.png)

You don't have to worry about the detailed view in this lab, as the view and code for that view have been given to you. In this lab, you'll be focusing on the implementation of the table view and, more importantly, the custom cells that make up that table view.

Here are the steps necessary to complete this lab:

1. Open up `Main.storyboard`.
2. Drag a new table view controller from the object library into the storyboard. Drop it in between the navigation controller scene and the detailed view scene. Make sure you set this view controller to be the _initial view controller_ in the Attributes Inspector.
3. Embed a navigation controller in the table view controller scene.
4. Set the nav bar title of the table view to "Math". (Hint: Use the table view controller's navigation item.)
5. Create a _segue_ from the table view's cells to the detail view. (Hint: Select **Table View Cell** in the object listing. Then <kbd>Control</kbd>-drag from the table view cell to the **Display Math View Controller** scene. Select **Show** under **Selection Segue** from the popup menu.)
6. Set the table view cell's _reuse identifier_ to "mathCell" using the Attributes Inspector.
7. Set the class of the table view controller to `TableViewController`.
8. Set the class of the prototype cells to `MathTableViewCell`.
9. Time to lay out the table view's cells! First, make sure the prototype cell is selected in the object listing (it will be listed as **mathCell**). Then, in the Size Inspector, change its height to 78. (You should see it grow a little taller in the storyboard.)
10. Add four labels to the prototype cell. (Adding views to the prototype cell can be tricky—make sure you still have it selected in the object library!) Change their font to Avenir 24.0, and the text alignment to center.
11. Now the fun part: You're going to add these labels to a _stack view_. This may sound hard, but it's actually pretty easy:
	1. Select all four labels in the prototype cell.
	2. Click the **Stack** button at the bottom of your Interface Builder editor. (It looks like this: ![Stack button](https://s3.amazonaws.com/learn-verified/ib-stack-button.png))
	3. The labels will now be arranged in a row, evenly spaced...allegedly. For that to happen, though, you have to add some _constraints_ to the stack view. Make sure the stack view is selected in the object listing, then click the **Constraints** button at the bottom of Interface Builder. (It looks like this: ![Constraints button](https://s3.amazonaws.com/learn-verified/ib-constraints-button.png))
	4. Enter **0** in all four text boxes in the Constraints popup, and press **Add 4 Constraints**.
	5. One more thing: With the stack view still selected, open up the Attributes Inspector and set the **Alignment** to **Center** and the **Distribution** to **Equal Spacing**.
12. Now you must hook up the labels you created in the prototype cell to their IB outlets in `MathTableViewCell`. Open up `MathTableViewCell.swift` in an assistant editor, then <kbd>Control</kbd>-drag a connection from each label to its associated IB outlet in `MathTableViewCell`.
13. Almost there! Now you just have to implement the code that will power the table view. Open up `TableViewController.swift` in Xcode's code editor.
14. Do you remember what methods you need to implement to make the table view controller work? The first method you need to override is `numberOfSectionsInTableView(_:)`, which should return `1`, because this table view only has one section.
15. Next, you need to override `tableView(_:numberOfRowsInSection:)` to return the number of rows in this table view. How many rows should you return? (Hint: the table view's `numbers` property contains all the data that should be displayed by this table view.)
16. Thirdly, you need to override `tableView(_:cellForRowAtIndexPath:)`. This method should return a cell for the given row, fully configured with the appropriate labels set. Don't forget to dequeue a reusable cell first! Remember, the index in `numbers` corresponding to the desired row contains an `Array` of four `Int`s, representing the numbers that should be displayed. You can get that `Array` using `indexPath.row`, then set the appropriate label in the cell to that number.
17. One final thing: You have to prepare the segue from the main table view to the detailed view when a cell is tapped. You should do this by overriding `prepareForSegue(_:sender:)`. Implementing this method may be a bit tricky. Look back over the previous lessons on segues to see how you might go about doing this. Remember: the destination view controller is of type `DisplayMathViewController`. `DisplayMathViewController` has a `numbers` property that allows you to set what numbers should appear in the colored grid.

You're done! When you've completed the above steps, you should have a fully-functional version of this app. Build and run it, then play around with it in the simulator. Tapping a table cell should take you to the detailed view, where you can the buttons at the bottom of the detailed view to see the results of math operations performed on the numbers in the grid.

Good luck!

<a href='https://learn.co/lessons/CustomCellLab' data-visibility='hidden'>View this lesson on Learn.co</a>
