//
//  PictureClearable.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

protocol PictureClearable: AnyObject {
    func clearPicture()
}

extension PictureClearable {
    func clearPicture() {}
}

extension PictureClearable where Self == FoodCell {
    func clearPicture() {
        picture.image = nil
    }
}
