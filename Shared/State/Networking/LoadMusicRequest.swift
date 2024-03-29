//
//  LoadPokemonRequest.swift
//  PokeMaster
//
//  Created by Wang Wei on 2019/08/22.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation
import Combine
import SwiftyJSON

struct LoadMusicRequest {
    let store: Store
    
    func toViewModel(data: Data) -> [MusicViewModel] {
        var result:[MusicViewModel] = []
        let item:MusicListModel = try! JSONDecoder().decode(MusicListModel.self, from: data);
        var num = store.appState.musicList.dataList.count;
        for model in item.data {
            var viewModel = MusicViewModel(music: model)
            viewModel.music.id = num;
            result.append(viewModel)
            num += 1
        }
        return result
    }
    
    var musicPublisher: AnyPublisher<[MusicViewModel], AppError> {
        URLSession.shared
            .dataTaskPublisher(for: URL(string: "http://loopwhere.com/getSendClinetData?page=\(store.appState.musicList.page)&size=\(store.appState.musicList.pageSize)")!)
            .map {toViewModel(data:$0.data)}
            .mapError { AppError.networkingFailed($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
