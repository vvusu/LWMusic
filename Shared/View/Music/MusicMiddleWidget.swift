//
//  MusicMiddleWidget.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 8/2/21.
//

import SwiftUI
import Kingfisher

struct MusicMiddleWidget: View {
    @EnvironmentObject var store: Store
    let model: MusicViewModel
    let screenW = UIScreen.main.bounds.width;

    var body: some View {
        HStack {
            ZStack {
                KFImage(URL.init(string: (model.music.albums?.first?.bigCover ?? "")))
                    .resizable()
                    .frame(width:116, height: 116)
                    .cornerRadius(4)
            }
            VStack {
                HStack {
                    Text("09")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    VStack {
                        Text("七月")
                            .font(.system(size: 9))
                            .foregroundColor(.white)
                        Text("周五")
                            .font(.system(size: 9))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image("music_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22, alignment: .leading)
                }
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(model.music.bandName!)
                            .font(.system(size: 14))
                            .lineLimit(1)
                            .foregroundColor(.white)
                        Text(model.music.bandInfo!)
                            .font(.system(size: 12))
                            .padding(.top,10)
                            .lineLimit(1)
                            .foregroundColor(Color.init(hex: model.contenColor))
                    }
                    Spacer()
                }
            }
            .padding(.leading, 18)
        }
        .padding(.init(top: 18, leading: 18, bottom: 19, trailing: 18))
        .frame(width: screenW, height: 153)
        .background(Color.init(hex: 0x201717))

    }
}
