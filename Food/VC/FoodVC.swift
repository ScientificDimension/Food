//
//  FoodVC.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 12/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

class FoodVC: UIViewController {

    // MARK: - Interactor
    
    private lazy var interactor: IFoodInteractor = FoodInteractor(self)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let canStart = interactor.tryGetFoodData()
        
        guard canStart else {
            print("Error: failed to start interactor")
            return
        }
    }
}
