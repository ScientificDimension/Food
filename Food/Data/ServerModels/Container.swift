//
//  Container.swift
//  Food
//
//  Created by Oleg Kolomyitsev on 11/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

struct Container: Decodable {
    let payload: Payload
    let meta: Meta
}

struct Payload: Decodable {
    let foundPlaces: [FoundPlace]
}

struct FoundPlace: Decodable {
    let place: Place
}

struct Place: Decodable {
    let id: Int
    let name: String
    let description: String?
    let picture: Picture
}

struct Picture: Decodable {
    let uri: String
    let ratio: CGFloat
}

struct Meta: Decodable {
    let count: Int
}
