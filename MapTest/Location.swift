//
//  Location.swift
//  MapTest
//
//  Created by Jacek Kosiński G on 09/04/2023.
//

import Foundation


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let address: String
    let country: String
    let flagEmoji: String
}

