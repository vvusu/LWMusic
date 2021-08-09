//
//  DefaultDataHelper.swift
//  LWMusic
//
//  Created by vvusu on 8/3/21.
//

import Foundation

extension MusicListModel {
    static func sample() -> MusicListModel {
        return FileHelper.loadBundledJSON(file: "musiclist")
    }
}
