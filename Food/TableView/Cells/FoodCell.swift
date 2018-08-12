//
//  FoodCell.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell, FoodConfigurable, PictureClearable {
    
    static let estimatedHeight: CGFloat = CellDimensions.image.height + 2 * CellDimensions.offset
    
    // MARK: - Debug
    
    private var highlight = false
    
    // MARK: - UI
    
    lazy var picture: UIImageView = {
        let p = UIImageView(frame: .zero)
        p.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(p)
        p.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellDimensions.offset).isActive = true
        p.heightAnchor.constraint(equalToConstant: CellDimensions.image.height).isActive = true
        p.widthAnchor.constraint(equalToConstant: CellDimensions.image.width).isActive = true
        p.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellDimensions.offset).isActive = true
        p.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -CellDimensions.offset).isActive = true

        return p
    }()
    
    lazy var title: UILabel = {
        let t = UILabel(frame: .zero)
        t.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(t)
        t.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellDimensions.offset).isActive = true
        t.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: CellDimensions.offset).isActive = true
        t.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellDimensions.offset).isActive = true
        
        return t
    }()
    
    lazy var info: UILabel = {
        let i = UILabel(frame: .zero)
        i.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(i)
        i.topAnchor.constraint(equalTo: title.bottomAnchor, constant: CellDimensions.offset).isActive = true
        i.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -CellDimensions.offset).isActive = true
        i.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: CellDimensions.offset).isActive = true
        i.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellDimensions.offset).isActive = true
        
        return i
    }()
    
    // MARK: - Memory Management
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configurations
    
    private func configure() {
        
        selectionStyle = .none
        backgroundColor = .white
        contentView.backgroundColor = .white

        picture.contentMode = .scaleAspectFill
        
        title.font = UIFont.systemFont(ofSize: 19)
        title.numberOfLines = 0
        title.textAlignment = .left
        
        info.font = UIFont.systemFont(ofSize: 9)
        info.numberOfLines = 0
        info.textAlignment = .natural
        
        if highlight {
            picture.backgroundColor = .red
            title.backgroundColor = .cyan
            info.backgroundColor = .green
        } else {
            picture.backgroundColor = .gray
            title.backgroundColor = .white
            info.backgroundColor = .white
        }
    }
}
