//
//  TableViewFlow.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 27/07/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

class TableViewFlow: NSObject, UITableViewDataSource, UITableViewDelegate, ITableViewFlow {
    
    // MARK: - TableView
    
    private weak var tableView: UITableView?
    
    // MARK: - Loader
    
    private(set) var loader: Loader = .kingfisher
    
    // MARK: - DataSource
    
    private var dataSource: [FoodModel] = []
    
    // MARK: - ITableViewFlow
    
    var imageLoader: Loader { return loader }
    
    func configure(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = FoodCell.estimatedHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(FoodCell.self, forCellReuseIdentifier: "\(FoodCell.self)")
    }
    
    func update(with models: [FoodModel]) {
        dataSource += models
    }
    
    func update(loader: Loader){
        self.loader = loader
        tryClearPictureInVisibleCells()
    }
    
    func tryReloadData() {
        tableView?.reloadData()
    }
    
    func clearCache() {
        clearCache(loader: loader)
        tryClearPictureInVisibleCells()
        tryReloadData()
    }
    
    // MARK: - Clearing Images in Visible Cells
    
    private func tryClearPictureInVisibleCells() {
        guard let tableView = tableView else {
            return
        }
        tableView.visibleCells.forEach { cell in
            if let cell = cell as? FoodCell {
                cell.clearPicture()
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FoodCell.self)", for: indexPath) as! FoodCell
        cell.configure(with: dataSource[indexPath.row], loader: loader)
        
        return cell
    }
}
