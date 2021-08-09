//
//  MusicBigWidget.swift
//  LWMusic
//
//  Created by vvusu on 8/2/21.
//

import SwiftUI
import Kingfisher

struct MusicBigWidget: MusicWidget, View {
    static var musicName: String = ""
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
    
    // 从上到下的渐变颜色
    let gradientTopColor = Color(hex:0x291E1E, alpha: 0)
    let gradientBottomColor = Color(hex:0x291E1E, alpha: 1.0)
    
    // 遮罩视图 简单封装 使代码更为直观
    func gradientView() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [gradientTopColor, gradientBottomColor]), startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                ZStack() {
                    Image(uiImage: model.bandBigCoverImg!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: geo.size.height * 238/344)
                        .position(x: geo.size.width/2, y: geo.size.height * 238/344 / 2)
                        .cornerRadius(4)
                    
                    gradientView()
                        .frame(width:geo.size.width, height: geo.size.height * 200/344)
                        .position(x: geo.size.width/2, y: geo.size.height * 200/344/2 + (geo.size.height * 238/344 - geo.size.height * 200/344))
                    
                    Image("music_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22, alignment: .leading)
                        .position(x: geo.size.width - 22, y: 22/2 + 18)
                    
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text(model.bandName)
                                    .font(.customAlfa(size: 26))
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                                Text("- \(model.albumAuthor)")
                                    .font(.customAlfa(size: 9))
                                    .padding(.top,0)
                                    .lineLimit(1)
                                    .foregroundColor(Color.init(hex:titleColor))
                                Text(model.bandInfo)
                                    .font(.customAlfa(size: 12))
                                    .padding(.top,2)
                                    .lineLimit(1)
                                    .foregroundColor(Color.init(hex: contenColor))
                            }
                            Spacer()
                        }
                    }
                    .padding(.init(top: 0, leading: 18, bottom: 5, trailing: 18))
                }
                
                Spacer()
                
                HStack {
                    Image(uiImage: model.albumCoverImg!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:54, height: 54)
                        .cornerRadius(4)
                    
                    VStack(alignment: .leading) {
                        Text(model.albumName)
                            .font(.customAlfa(size: 12))
                            .lineLimit(1)
                            .foregroundColor(.white)
                        Text("2009／\(model.albumPlace)／\(model.albumName)")
                            .font(.customAlfa(size: 9))
                            .padding(.top,2)
                            .lineLimit(1)
                            .foregroundColor(Color.init(hex: contenColor))
                        Text(model.albumAppraise)
                            .font(.customAlfa(size: 9))
                            .padding(.top,2)
                            .lineLimit(1)
                            .foregroundColor(Color.init(hex: contenColor))
                    }
                    .padding(.leading,16)
                    
                    Spacer()
                    
                    VStack() {
                        Text(String.timeStampToString(timeStamp: model.showDate,dateFormat: "dd"))
                            .font(.customAlfa(size: 38))
                            .foregroundColor(.white)
                            .padding(.top, -5)
                        
                        HStack(alignment: .center) {
                            Text(String.covertMMDate(timeStamp: model.showDate))
                                .font(.customAlfa(size: 9))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                            Text("|")
                                .font(.customAlfa(size: 9))
                                .foregroundColor(.white)
                            Text(String.timeStampToWeekday(timeStamp: model.showDate))
                                .font(.system(size: 9))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        
                        }
                        Spacer()
                    }
                }
                .padding(.init(top: 28, leading: 18, bottom: 19, trailing: 18))
                .frame(height:geo.size.height*106/344)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.init(hex: 0x201717))
        }
    }
}

struct MusicBigWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicBigWidget(date: Date(), config:MusicWidgetConfig.createEmpty(name: ""))
                .frame(height:344)
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
