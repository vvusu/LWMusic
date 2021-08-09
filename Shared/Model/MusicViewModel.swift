//
//  MusicViewModel.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 7/31/21.
//

import SwiftUI

struct MusicViewModel:Identifiable, Decodable {
    var music: Music
    var id: Int { music.id }
    var titleColor = 0xCCCCCC;
    var contenColor = 0xB3B3B3;
}

extension MusicViewModel: CustomStringConvertible {
    var description: String {
        "MusicViewModel - \(self.music.bandName)"
    }
}
