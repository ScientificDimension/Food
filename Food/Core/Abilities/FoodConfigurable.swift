//
//  FoodConfigurable.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation

protocol FoodConfigurable: AnyObject {
    func configure(with model: FoodModel, loader: Loader)
}

extension FoodConfigurable {
    func configure(with model: FoodModel, loader: Loader) {}
}

extension FoodConfigurable where Self == FoodCell {
    func configure(with model: FoodModel, loader: Loader) {
        picture.trySetImage(with: model.picture, loader: loader)
        title.text = model.title
        info.text =  model.info
    }
}
