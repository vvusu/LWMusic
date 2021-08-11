//
//  MusicWidgetConfig.swift
//  LWMusic
//
//  Created by vvusu on 8/4/21.
//

import SwiftUI

/**
 储存在UserDefaults里的原始数据
 */
struct StorableMusicConfig: Codable {
    var showDate: Double
    var bandName: String
    var bandInfo: String
    var bandShortInfo: String
    var bandBigCoverPath: String?
    var bandSmallCoverPath: String?
    var albumCoverPath: String?
    var albumName: String
    var albumAuthor: String
    var albumStyle: String
    var albumPlace: String
    var albumAppraise: String
    var albumrPubdate: Double
    var recommendSong: String
    var recommendInfo: String
    var recommendedDescriptionShort: String
}

/**
 组件读取的config信息
 */
struct MusicWidgetConfig {
    var showDate: Double
    var bandName: String
    var bandInfo: String
    var bandShortInfo: String
    var bandBigCoverImg: UIImage?
    var bandSmallCoverImg: UIImage?
    var albumCoverImg: UIImage?
    var albumName: String
    var albumAuthor: String
    var albumStyle: String
    var albumPlace: String
    var albumAppraise: String
    var albumrPubdate: Double
    var recommendSong: String
    var recommendInfo: String
    var recommendedDescriptionShort: String
    
    init(
        showDate: Double,
        bandName: String,
        bandInfo: String,
        bandShortInfo: String,
        bandBigCoverImg: UIImage?,
        bandSmallCoverImg: UIImage?,
        albumCoverImg: UIImage?,
        albumName: String,
        albumAuthor: String,
        albumStyle: String,
        albumPlace: String,
        albumAppraise: String,
        albumrPubdate: Double,
        recommendSong: String,
        recommendInfo: String,
        recommendedDescriptionShort: String
    ) {
        self.showDate = showDate
        self.bandName = bandName
        self.bandInfo = bandInfo
        self.bandShortInfo = bandShortInfo
        self.bandBigCoverImg = bandBigCoverImg
        self.recommendedDescriptionShort = recommendedDescriptionShort
        self.albumCoverImg = albumCoverImg
        self.albumName = albumName
        self.albumAuthor = albumAuthor
        self.albumStyle = albumStyle
        self.albumPlace = albumPlace
        self.albumrPubdate = albumrPubdate
        self.albumAppraise = albumAppraise
        self.recommendSong = recommendSong
        self.recommendInfo = recommendInfo
    }

    // 通过StorableClockConfig来初始化
    init(fromStorableConfig config: StorableMusicConfig) {
        var bandBigCoverImg: UIImage?
        var bandSmallCoverImg: UIImage?
        var albumCoverImg: UIImage?
        
        if let imgPath = config.bandBigCoverPath {
            bandBigCoverImg = UIImage(named: imgPath)
        }
        if let imgPath = config.bandSmallCoverPath {
            bandSmallCoverImg = UIImage(named: imgPath)
        }
        if let imgPath = config.albumCoverPath {
            albumCoverImg = UIImage(named: imgPath)
        }
        
        self.init(
            showDate: config.showDate,
            bandName: config.bandName,
            bandInfo: config.bandInfo,
            bandShortInfo: config.bandShortInfo,
            bandBigCoverImg: bandBigCoverImg,
            bandSmallCoverImg: bandSmallCoverImg,
            albumCoverImg: albumCoverImg,
            albumName: config.albumName,
            albumAuthor: config.albumAuthor,
            albumStyle: config.albumStyle,
            albumPlace: config.albumPlace,
            albumAppraise: config.albumAppraise,
            albumrPubdate: config.albumrPubdate,
            recommendSong: config.recommendedDescriptionShort,
            recommendInfo: config.recommendSong,
            recommendedDescriptionShort: config.recommendInfo
        )
    }
    
    static func createEmpty(name: String) -> MusicWidgetConfig {
        return Self(fromStorableConfig: StorableMusicConfig(showDate: 1628423914,
                                                            bandName: "The Heliocentrics",
                                                            bandInfo: "伦敦迷幻爵士乐队太阳中心主义者起源于90年代，当时鼓手马尔科姆·卡托为莫瓦克斯和爵士乐演奏。并与埃西奥爵士先驱Mulatu Astatke等传奇人物的合作闻名。",
                                                            bandShortInfo: "伦敦迷幻爵士乐队太阳中心主义者起源于90年代，当时鼓手马尔科姆·卡托为莫瓦克斯和爵士乐演奏。",
                                                            bandBigCoverPath: "band_cover1",
                                                            bandSmallCoverPath: "band_cover1",
                                                            albumCoverPath: "album_cover1",
                                                            albumName: "Infinity Of Now",
                                                            albumAuthor: "Psychedelic Jazz Funk",
                                                            albumStyle: "",
                                                            albumPlace: "英国",
                                                            albumAppraise: "🗿🗿🗿🗿",
                                                            albumrPubdate: 1628423914,
                                                            recommendSong: "Light in the Dark",
                                                            recommendInfo: "温柔温柔的夏夜 去听一首",
                                                            recommendedDescriptionShort: "歌中他发展了人文文化。"
                                                            ))
    }
}
