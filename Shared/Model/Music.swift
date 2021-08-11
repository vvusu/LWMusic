//
//  Music.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 7/31/21.
//

import SwiftUI
import Foundation

struct Music: Decodable {
    @Default<Int> var id: Int
    @Default<Double> var showDate: Double
    @Default<String> var bandName: String
    @Default<String> var bandInfo: String
    @Default<String> var bandBigCover: String
    @Default<String> var bandShortInfo: String
    @Default<String> var bandSmallCover: String
    @Default<String> var recommendedDescriptionShort: String
    var albums:[MusicAlbum] = []
}

extension Music: Identifiable { }

extension Music: CustomDebugStringConvertible {
    var debugDescription: String {
        "Music - \(id) - \(self.bandName)"
    }
}


// MusicSong
struct MusicSong: Decodable {
    @Default<String> var name: String
    @Default<String> var info: String
}

extension MusicSong: CustomDebugStringConvertible {
    var debugDescription: String {
        "Music - \(self.name)"
    }
}

// MusicAlbum
struct MusicAlbum: Decodable {
    @Default<Double> var pubdate: Double
    @Default<Double> var scores: Double
    @Default<String> var name: String
    @Default<String> var place: String
    @Default<String> var style: String
    @Default<String> var author: String
    @Default<String> var appraise: String
    @Default<String> var bigCover: String
    @Default<String> var smallCover: String
    @Default<String> var description: String
    @Default<String> var descriptionSource: String
    @Default<MusicSong> var recommend:MusicSong;
}

extension MusicAlbum: CustomDebugStringConvertible {
    var debugDescription: String {
        "MusicAlbum - \(self.name)"
    }
}

// MusicListModel
struct MusicListModel: Decodable {
    @Default<Int> var code: Int
    @Default<String> var msg: String
    var data: [Music]
}
