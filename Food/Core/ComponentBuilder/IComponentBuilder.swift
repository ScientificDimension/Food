//
//  IComponentBuilder.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 12/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

protocol IComponentBuilder {
    func buildTableView(addedTo superview: UIView) -> UITableView
    func buildClearCacheButton(addedTo superview: UIView) -> UIButton
    func buildImageLoaderSwitcher(addedTo superview: UIView) -> UISegmentedControl
}
