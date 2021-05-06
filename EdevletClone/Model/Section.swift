//
//  Section.swift
//  EdevletClone
//
//  Created by Kerim Caglar on 6.05.2021.
//

import Foundation

struct Section: Decodable, Hashable {
    let id: Int
    let type: String
    let title: String
    let subtitle: String
    let items: [EDevlet]
}
