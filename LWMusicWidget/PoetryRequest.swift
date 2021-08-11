//
//  PoetryRequest.swift
//  LWMusicWidgetExtension
//
//  Created by vvusu on 8/9/21.
//

import SwiftUI

struct MusicWidgetRquest {
    
    static func request(completion: @escaping(Result<MusicWidgetConfig, Error>) -> Void) {
        let url = URL(string: "http://loopwhere.com/getSendClinetData?page=1&size=1")
        let task = URLSession.shared.dataTask(with: url!) { (data, respone, error) in
            if (error != nil || data == nil) {
                completion(.failure(error!))
            } else {
                let entry = poetryFromJson(fromData: data!)
                completion(.success(entry))
            }
        }
        task.resume()
    }
    
    static func poetryFromJson(fromData data:Data) -> MusicWidgetConfig {
        let item:MusicListModel = try! JSONDecoder().decode(MusicListModel.self, from: data);
        let data = item.data.first
        let album = data?.albums.first
        //    //这里加入对图片进行同步请求
        var bandBigCoverImg: UIImage? = nil
        if let iamgeData = try? Data(contentsOf: URL(string: data!.bandBigCover)!) {
            bandBigCoverImg = UIImage(data: iamgeData)
        }
        var bandSmallCoverImg: UIImage? = nil
        if let iamgeData = try? Data(contentsOf: URL(string: data!.bandSmallCover)!) {
            bandSmallCoverImg = UIImage(data: iamgeData)
        }
        var albumCoverImg: UIImage? = nil
        if let iamgeData = try? Data(contentsOf: URL(string: album!.bigCover)!) {
            albumCoverImg = UIImage(data: iamgeData)
        }
        
        return MusicWidgetConfig.init(showDate: data!.showDate,
                                      bandName: data!.bandName,
                                      bandInfo: data!.bandInfo,
                                      bandShortInfo: data!.bandShortInfo,
                                      bandBigCoverImg: bandBigCoverImg,
                                      bandSmallCoverImg: bandSmallCoverImg,
                                      albumCoverImg: albumCoverImg,
                                      albumName: album!.name,
                                      albumAuthor: album!.author,
                                      albumStyle: album!.style,
                                      albumPlace: album!.place,
                                      albumAppraise: album!.appraise,
                                      albumrPubdate: album!.pubdate,
                                      recommendSong: album!.recommend.name,
                                      recommendInfo: album!.recommend.info,
                                      recommendedDescriptionShort: data!.recommendedDescriptionShort)
    }
}
