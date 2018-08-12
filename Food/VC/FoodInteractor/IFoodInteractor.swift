//
//  IFoodInteractor.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 12/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation

typealias CanStart = Bool

protocol IFoodInteractor {
    @discardableResult
    func tryGetFoodData() -> CanStart
}
