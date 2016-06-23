//
//  ViewController.swift
//  UpForTask
//
//  Created by Khalid Naseem on 20/06/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//

import UIKit

class UpToTaskViewController: UITableViewController {
    
    var items: [UpToTaskItem]
    
    required init?(coder aDecoder: NSCoder) {
        
        items = [UpToTaskItem]()
        
        let row0item = UpToTaskItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = UpToTaskItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = UpToTaskItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = UpToTaskItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = UpToTaskItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "UpToTaskItem", forIndexPath: indexPath)
        
        let item = items[indexPath.row]
        
        configureTextForCell(cell, withUpToTaskItem: item)
        configureCheckmarkForCell(cell, withUpToTaskItem: item)
        return cell
    }
    
    override func tableView(tableView: UITableView,
                            didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmarkForCell(cell, withUpToTaskItem: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
       
    func configureCheckmarkForCell(cell: UITableViewCell,
                                   withUpToTaskItem item: UpToTaskItem) {
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    func configureTextForCell(cell: UITableViewCell,
                              withUpToTaskItem item: UpToTaskItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
}
