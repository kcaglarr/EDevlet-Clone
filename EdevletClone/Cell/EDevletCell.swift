//
//  EDevletCell.swift
//  EdevletClone
//
//  Created by Kerim Caglar on 6.05.2021.
//

import Foundation

protocol EDevletCell {
    static var reusableIdentifier: String { get }
    func configure(with edevlet: EDevlet?)
}
