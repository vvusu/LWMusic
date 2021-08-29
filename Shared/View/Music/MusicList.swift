//
//  MusicList.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 7/12/21.
//

import SwiftUI

struct MusicList: View {
    @EnvironmentObject var store: Store
    
    var musicList: AppState.MusicList { store.appState.musicList }
    
    var body: some View {
        ScrollView {
            TabView(selection: $store.appState.musicList.selectionRow) {
                ForEach(musicList.dataList) { model in
                    MusicDetail(index: model.id, model:model)
                }
            }
            .background(Color.init(hex: 0x201717))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .statusBar(hidden: true)
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
