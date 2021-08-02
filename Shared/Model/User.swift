//
//  User.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 7/31/21.
//

import Foundation

struct User: Codable {
    var name: String
    var email: String
    var favoriteMusicIDs: Set<Int>

    func isFavoriteMusic(id: Int) -> Bool {
        favoriteMusicIDs.contains(id)
    }
}
