//
//  UIImageView+LoadImage.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Kingfisher
import SDWebImage
import Nuke

// MARK: - Loaders

enum Loader {
    
    static let all:[Loader] = [.kingfisher, .sdwebimage, .nuke]
    
    case kingfisher, sdwebimage, nuke
    
    // MARK: - Memory Management
    
    init(value: Int) {
        switch value {
        case 0:  self = .kingfisher
        case 1:  self = .sdwebimage
        default: self = .nuke
        }
    }

    // MARk: - Index and Title
    
    var index: Int {
        switch self {
        case .kingfisher: return 0
        case .sdwebimage: return 1
        case .nuke:       return 2
        }
    }

    var title: String {
        switch self {
        case .kingfisher: return "Kingfisher"
        case .sdwebimage: return "SDWebImage"
        case .nuke:       return "Nuke"
        }
    }
    
}

// MARK: - Image Loading

extension UIImageView {
    
    func trySetImage(with url: URL?, loader: Loader) {
        guard let url = url else {
            return
        }
        switch loader {
        case .kingfisher:
            kf.setImage(with: url)
        case .sdwebimage:
            sd_setImage(with: url, completed: nil)
        case .nuke:
            Nuke.loadImage(with: url, into: self)
        }
    }
}

// MARK: - Cache Clearing

protocol CacheClearable {
    func clearCache(loader: Loader)
}

extension CacheClearable {
    func clearCache(loader: Loader) {
        switch loader {
        case .kingfisher:
            ImageCache.default.clearDiskCache()
            ImageCache.default.clearMemoryCache()
        case .sdwebimage:
            SDImageCache.shared().clearMemory()
            SDImageCache.shared().clearDisk()
        case .nuke:
            Nuke.DataLoader.sharedUrlCache.removeAllCachedResponses()
        }
    }
}
