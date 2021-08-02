//
//  Music.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 7/31/21.
//

import Foundation

struct Music: Codable {
    var id: Int? = 0
    let showDate: Int?
    let bandName: String?
    let bandInfo: String?
    let bandBigCover: String?
    let bandShortInfo: String?
    let bandSmallCover: String?
    let recommendedDescriptionShort: String?
    let albums:[MusicAlbum]?
    
    // 手动对应key
    enum MusicKeys: String, CodingKey {
        case id = "id"
        case showDate = "showDate"
        case bandName = "bandName"
        case bandInfo = "bandInfo"
        case bandBigCover = "bandBigCover"
        case bandShortInfo = "bandShortInfo"
        case bandSmallCover = "bandSmallCover"
        case recommendedDescriptionShort = "recommendedDescriptionShort"
        case albums = "albums"
    }
    
    init(from decoder: Decoder) throws {
        let value = try? decoder.container(keyedBy: MusicKeys.self);
        id = (try? value?.decode(Int.self, forKey: .id)) ?? 1;
        showDate = (try? value?.decode(Int.self, forKey: .showDate)) ?? 0;
        bandName = (try? value?.decode(String.self, forKey: .bandName)) ?? "";
        bandInfo = (try? value?.decode(String.self, forKey: .bandInfo)) ?? "";
        bandBigCover = (try? value?.decode(String.self, forKey: .bandBigCover)) ?? "";
        bandShortInfo = (try? value?.decode(String.self, forKey: .bandShortInfo)) ?? "";
        bandSmallCover = (try? value?.decode(String.self, forKey: .bandSmallCover)) ?? "";
        recommendedDescriptionShort = (try? value?.decode(String.self, forKey: .recommendedDescriptionShort)) ?? "";
        albums = (try? value?.decode([MusicAlbum].self, forKey: .albums)) ?? [];
    }
}

extension Music: Identifiable { }

extension Music: CustomDebugStringConvertible {
    var debugDescription: String {
        "Music - \(id!) - \(self.bandName!)"
    }
}


// MusicSong
struct MusicSong: Codable {
    let name: String?
    let info: String?
}

extension MusicSong: CustomDebugStringConvertible {
    var debugDescription: String {
        "Music - \(self.name!)"
    }
}

// MusicAlbum
struct MusicAlbum: Codable {
    let pubdate: Int?
    let scores: Float?
    let name: String?
    let place: String?
    let style: String?
    let author: String?
    let appraise: String?
    let bigCover: String?
    let smallCover: String?
    let description: String?
    let descriptionSource: String?
    let recommend:MusicSong?;
}

extension MusicAlbum: CustomDebugStringConvertible {
    var debugDescription: String {
        "MusicAlbum - \(self.name!)"
    }
}

// MusicListModel
struct MusicListModel: Codable {
    var code: Int
    var msg: String
    var data: [Music]?
}
