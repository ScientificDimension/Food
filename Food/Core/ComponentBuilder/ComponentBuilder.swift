//
//  ComponentBuilder.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 12/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

class ComponentBuilder: IComponentBuilder {
    
    // MARK: - Dimensions
    
    private enum Dimensions {
        static let height: CGFloat = 30
        static let offset: CGFloat = 8
        static let clearButtonWidth: CGFloat = 100
    }

    // MARK: - IComponentBuilder
    
    func buildTableView(addedTo superview: UIView) -> UITableView {
        let t: UITableView = commonBuild(addedTo: superview)
        let guide = superview.safeAreaLayoutGuide
        t.topAnchor.constraint(equalTo: guide.topAnchor, constant: Dimensions.height + 2 * Dimensions.offset).isActive = true
        t.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        t.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        t.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        return t
    }
    
    func buildClearCacheButton(addedTo superview: UIView) -> UIButton {
        let b: UIButton = commonBuild(addedTo: superview)
        let guide = superview.safeAreaLayoutGuide
        b.topAnchor.constraint(equalTo: guide.topAnchor, constant: Dimensions.offset).isActive = true
        b.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: Dimensions.offset).isActive = true
        b.heightAnchor.constraint(equalToConstant: Dimensions.height).isActive = true
        b.widthAnchor.constraint(equalToConstant: Dimensions.clearButtonWidth).isActive = true
        
        return b
    }
    
    func buildImageLoaderSwitcher(addedTo superview: UIView) -> UISegmentedControl {
        let s: UISegmentedControl = commonBuild(addedTo: superview)
        let guide = superview.safeAreaLayoutGuide
        s.topAnchor.constraint(equalTo: guide.topAnchor, constant: Dimensions.offset).isActive = true
        s.heightAnchor.constraint(equalToConstant: Dimensions.height).isActive = true
        s.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: Dimensions.clearButtonWidth + 2 *  Dimensions.offset).isActive = true
        s.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        return s
    }
    
    // MARK: - Common Building
    
    private func commonBuild<Component: UIView>(addedTo superview: UIView) -> Component {
        let component = Component.init()
        superview.addSubview(component)
        component.translatesAutoresizingMaskIntoConstraints = false
        
        return component
    }
}
