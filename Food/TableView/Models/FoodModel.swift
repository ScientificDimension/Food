//
//  FoodModel.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

struct FoodModel {
    
    let picture: URL?
    let title: String
    let info: String
    
    // MARK: - Memory Management
    
    init(place: Place) {
        func update(_ pictureURI: String) -> String {
            let scale = UIScreen.main.scale
            let width = Int(CellDimensions.image.width * scale)
            let updatedWidth = pictureURI.replacingOccurrences(of: "{w}", with: "\(width)")
            let height = Int(CellDimensions.image.height * scale)
            let updatedHeight = updatedWidth.replacingOccurrences(of: "{h}", with: "\(height)")
            
            return Constants.baseUrl + updatedHeight
        }
        
        picture = URL(string: update(place.picture.uri))
        title = place.name
        info = place.description ?? ""
    }
}
