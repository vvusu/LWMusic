//
//  MusicMiddleWidget.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 8/2/21.
//

import SwiftUI

struct MusicMiddleWidget: MusicWidget, View {
    static var musicName: String  = ""
    let date: Date
    var titleColor = 0xCCCCCC;
    var contenColor = 0xB3B3B3;
    let model: MusicWidgetConfig
    var config: MusicWidgetConfig

    init(date: Date, config widgetConfig: MusicWidgetConfig = MusicWidgetConfig.createEmpty(name: "")) {
        self.date = date
        model = widgetConfig
        config = widgetConfig
    }
    
    var body: some View {
        GeometryReader{ geo in
            HStack {
                ZStack {
                    Image(uiImage: model.albumCoverImg!)
                        .resizable()
                        .scaledToFill()
                        .frame(width:116, height: 116)
                        .cornerRadius(4)
                }
                VStack {
                    HStack {
                        Text(String.timeStampToString(timeStamp: model.showDate,dateFormat: "dd"))
                            .font(.customAlfa(size: 30))
                            .foregroundColor(.white)
                        VStack {
                            Text(String.covertMMDate(timeStamp: model.showDate))
                                .font(.customAlfa(size: 9))
                                .foregroundColor(.white)
                            Text(String.timeStampToWeekday(timeStamp: model.showDate))
                                .font(.customAlfa(size: 9))
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
                            Text(model.recommendSong)
                                .font(.customAlfa(size: 14))
                                .lineLimit(1)
                                .foregroundColor(.white)
                            Text(model.recommendedDescriptionShort)
                                .font(.customAlfa(size: 12))
                                .padding(.top,10)
                                .lineLimit(2)
                                .foregroundColor(Color.init(hex: contenColor))
                        }
                        Spacer()
                    }
                }
                .padding(.leading, 18)
            }
            .padding(.init(top: 18, leading: 18, bottom: 19, trailing: 18))
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.init(hex: 0x201717))
        }
    }
}


struct MusicMiddleWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicMiddleWidget(date: Date(), config:MusicWidgetConfig.createEmpty(name: "")).frame(height:153)
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
