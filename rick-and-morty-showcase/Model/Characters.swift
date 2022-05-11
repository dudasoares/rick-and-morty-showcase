//
//  Characters.swift
//  rick-and-morty-showcase
//
//  Created by Eduarda Soares Serpa Camboim on 11/05/22.
//

import Foundation

struct Character: CustomStringConvertible {
    let id: Int
    let name: String
    let specie: String
    let image_path: String
    let status: String
    let gender: String
    let origin: String
    let location: String

    
    var description: String {
        return "\(name) is a(n) \(specie) with \(id) ID"
    }
}

