//
//  IDataLoader.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import PromiseKit

protocol IDataLoader {
    func getModels() -> Promise<[FoodModel]>
}
