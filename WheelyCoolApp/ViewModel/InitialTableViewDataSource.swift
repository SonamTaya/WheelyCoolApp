//
//  InitialTableViewDataSource.swift
//  WheelyCoolApp
//
//  Created by sonam taya on 16/2/22.
//

import UIKit

class InitialTableDataSource<T>  : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [T]?
    var configureCell : (UITableViewCell, T) -> () = {_,_ in }
    
    
    init(items : [T], configureCell : @escaping (UITableViewCell, T) -> ()) {
        self.items =  items
        self.configureCell = configureCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
           cell.selectionStyle = .none
        if let item = self.items?[indexPath.row] {
        self.configureCell(cell, item)
        }
        return cell
    }
}
