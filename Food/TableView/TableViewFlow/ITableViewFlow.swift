//
//  ITableViewFlow.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

protocol ITableViewFlow: AnyObject, CacheClearable {
    var imageLoader: Loader { get }
    func configure(_ tableView: UITableView)
    func update(with models: [FoodModel])
    func update(loader: Loader)
    func tryReloadData()
    func clearCache()
}
