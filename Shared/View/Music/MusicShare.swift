//
//  MusicShare.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 8/30/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MusicShare: View {
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var store: Store
    @State var contentRect: CGRect = CGRect()
    let model: MusicViewModel
    let screenW = UIScreen.main.bounds.width;
    let screenH = UIScreen.main.bounds.height;
    
    var contentView: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .center) {
                        Text(String.timeStampToString(timeStamp: model.music.showDate,dateFormat: "dd"))
                            .font(.system(size: 26))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.init(top: 3, leading: 3, bottom: 3, trailing: 3))
                            .background(Color.black)
                            .cornerRadius(5)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text(String.covertMMDate(timeStamp: model.music.showDate))
                                .font(.system(size: 9))
                                .foregroundColor(Color.init(hex: 0x18130D))
                            Text("|")
                                .font(.system(size: 12))
                                .fontWeight(.black)
                                .foregroundColor(Color.init(hex: 0x999999))
                            Text(String.timeStampToWeekday(timeStamp: model.music.showDate))
                                .font(.system(size: 9))
                                .foregroundColor(Color.init(hex: 0x18130D))
                        }
                        Spacer()
                    }
                    .padding(.top,5)
                    .padding(.leading,10)
                    
                    Spacer()
                    VStack {
                        ZStack(alignment: .center) {
                            Image("share_year_box")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 13)
                            Text(String.timeStampToString(timeStamp: model.music.showDate ,dateFormat: "yyyy"))
                                .font(.customAlfa(size: 8))
                            Spacer()
                        }.padding(.top,6)
                    }

                }.frame(height: 80)
                .padding(.init(top: 10, leading: 16, bottom: 0, trailing: 16))
                .fixedSize(horizontal: false, vertical: true)
    
                HStack {
                    VStack(alignment: .leading) {
                        Text(model.music.albums.first?.name ?? "")
                            .font(.system(size: 38))
                            .bold()
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(minWidth: 100, maxWidth: screenW - 160, minHeight: 38, maxHeight: 38)
                        
                        Text(model.music.bandName)
                            .font(.system(size: 20))
                            .bold()
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(minWidth: 100, maxWidth: screenW - 160, minHeight: 38, maxHeight: 38)
                    }
                    .padding(.init(top: 0, leading: 30, bottom: 30, trailing: 30))
                }
    
                VStack(alignment: .leading) {
                    Image("share_quotes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 20, alignment: .leading)
                    
                    Text(model.music.albums.first?.description ?? "")
                        .font(.system(size: 10))
                        .lineSpacing(4)
                        .padding(.top,15)
                        .lineLimit(3)
                        .foregroundColor(Color.init(hex: 0x18130D))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.init(top: 0, leading: 50, bottom: 30, trailing: 50))
    
                ZStack {
                    WebImage(url: URL(string: (model.music.albums.first?.bigCover ?? "")))
                        .placeholder{Image("music_album_ph")}
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:(screenW - 110 * 2), height: (screenW - 110 * 2))
                        .cornerRadius(6)
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        HStack {
                            Text("\(String.timeStampToString(timeStamp: model.music.albums.first?.pubdate ?? 1628423914,dateFormat: "yyyy"))／\(model.music.albums.first?.place ?? "")")
                                .font(.system(size: 9))
                                .padding(.init(top: 1, leading: 1, bottom: 0, trailing: 1))
                                .lineLimit(1)
                                .background(Color.black)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.white)
                                .cornerRadius(0)                            
                            Spacer()
                        }
      
                        HStack {
                            Text("\(model.music.albums.first?.style ?? "")/\(model.music.albums.first?.name ?? "")")
                                .font(.system(size: 9))
                                .padding(.init(top: 0, leading: 1, bottom: 1, trailing: 1))
                                .lineLimit(1)
                                .background(Color.black)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.white)
                                .cornerRadius(0)
                            Spacer()
                        }
                    }
                    .padding(.leading, 6)
                    .padding(.bottom, 8)
                }
                .frame(width: screenW - 100 * 2, height: screenW - 100 * 2)
                .padding(.bottom, 53)
                
                HStack {
                    HStack(alignment: .center) {
                        Image("share_icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 16)
                        
                        Text("发现好音乐，APPstore搜索“欢迎做客”下载体验")
                            .font(.system(size: 10))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .frame(height:42)
                    .background(Color.init(hex: 0xA5402C))
                    
                    VStack {
                        Spacer()
                        Image("share_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 52, height: 22, alignment: .leading)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .background(Color.init(hex: 0x8C949F))
                }
                .frame(height:42)
                
            }.background(Color.init(hex: 0xF0F0F0)).cornerRadius(10)
        }.frame(width: screenW - 100)
    }
    
    var body: some View {
        ZStack {
            VStack {
                contentView
                Button(action: {
                    // 保存图片到相册
                    let image = contentView.snapshot()
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    store.appState.musicList.showTextInfo = true
                    store.appState.musicList.savePhotoSuccess = true
                    self.mode.wrappedValue.dismiss()
                }){
                    Text("保存到相册").font(.system(size: 12)).foregroundColor(Color.white).frame(width:screenW - 60 ,height: 40)
                }
                .frame(width:screenW - 60 ,height: 40)
                .background(Color.init(hex: 0xD35931))
                .cornerRadius(20)
                .padding(.top,30)
            }
        }
        .frame(width: screenW, height: screenH)
        .background(Color.init(hex: 0x000000, alpha: 0.8))
        .onTapGesture {
            self.mode.wrappedValue.dismiss()
        }
    }
}


struct MusicShare_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            let model = MusicViewModel(music: MusicList())
//            MusicDetail(model:model).environment(\.colorScheme, .dark)
//                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
