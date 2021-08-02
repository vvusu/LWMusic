//
//  MusicBigWidget.swift
//  LWMusic
//
//  Created by vvusu on 8/2/21.
//

import SwiftUI
import Kingfisher

struct MusicBigWidget: View {
    @EnvironmentObject var store: Store
    let model: MusicViewModel
    let screenW = UIScreen.main.bounds.width;

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                KFImage(URL.init(string: model.music.bandBigCover!))
                    .resizable()
                    .frame(height: 238)
                
                HStack{
                    Spacer()
                }
                .frame(height: 200)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.init(hex: 0x291E1E, alpha: 0), Color.init(hex: 0x291E1E,alpha: 1.0)]), startPoint: .top, endPoint: .bottom))
                
                VStack {
                    HStack {
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
                                .font(.system(size: 26))
                                .lineLimit(1)
                                .foregroundColor(.white)
                            Text("- \(model.music.albums?.first?.author ?? "")")
                                .font(.system(size: 9))
                                .padding(.top,0)
                                .lineLimit(1)
                                .foregroundColor(Color.init(hex: model.titleColor))
                            Text(model.music.bandInfo!)
                                .font(.system(size: 12))
                                .padding(.top,2)
                                .lineLimit(1)
                                .foregroundColor(Color.init(hex: model.contenColor))
                        }
                        Spacer()
                    }
                }
                .padding(.init(top: 18, leading: 18, bottom: 10, trailing: 18))
            }
            
            Spacer()
            
            HStack {
                KFImage(URL.init(string: (model.music.albums?.first?.bigCover ?? "")))
                    .resizable()
                    .frame(width:54, height: 54)
                    .cornerRadius(4)
                VStack(alignment: .leading) {
                    Text(model.music.albums?.first?.name ?? "")
                        .font(.system(size: 12))
                        .lineLimit(1)
                        .foregroundColor(.white)
                    Text("2009／\(model.music.albums?.first?.place ?? "")／\(model.music.albums?.first?.style ?? "")")
                        .font(.system(size: 9))
                        .padding(.top,2)
                        .lineLimit(1)
                        .foregroundColor(Color.init(hex: model.contenColor))
                    Text(model.music.albums?.first?.appraise ?? "")
                        .font(.system(size: 9))
                        .padding(.top,2)
                        .lineLimit(1)
                        .foregroundColor(Color.init(hex: model.contenColor))
                }
                .padding(.leading,16)
                
                Spacer()
                
                VStack {
                    Text("09")
                        .font(.system(size: 38))
                        .foregroundColor(.white)
                    HStack(alignment: .center) {
                        Text("七月")
                            .font(.system(size: 9))
                            .foregroundColor(.white)
                        Text("|")
                            .font(.system(size: 9))
                            .foregroundColor(.white)
                        Text("周五")
                            .font(.system(size: 9))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.top, 28)
            .frame(height:106)
        }
        .padding(.init(top: 18, leading: 18, bottom: 19, trailing: 18))
        .frame(width: screenW, height: 344)
        .background(Color.init(hex: 0x201717))

    }
}

