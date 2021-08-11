//
//  MusicRow.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 7/12/21.
//

import SwiftUI
import Kingfisher
import MobileCoreServices

struct MusicDetail: View {
    @EnvironmentObject var store: Store
    let model: MusicViewModel
    let screenW = UIScreen.main.bounds.width;

    @State private var mosaicArrowDim = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ZStack(alignment: .bottom) {
                    KFImage(URL.init(string: model.music.bandBigCover))
                        .placeholder({
                            Image(systemName: "band_cover1")
                        })
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: screenW*(300/375))
                    HStack{
                        Spacer()
                    }
                    .frame(height: 100)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.init(hex: 0x000000, alpha: 0), Color.init(hex: 0x231717,alpha: 0.97)]), startPoint: .top, endPoint: .bottom))
                }
                
                HStack(alignment: .top) {
                    VStack(alignment: .center) {
                        Text(String.timeStampToString(timeStamp: model.music.showDate,dateFormat: "dd"))
                            .font(.customAlfa(size: 32))
                            .foregroundColor(.white)
                        Image("music_mosaic_arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 21)
                            .padding(.top, -5)
                            .opacity(mosaicArrowDim ? 1.0: 0.2)
                            .offset(x: mosaicArrowDim ? 0 : 0, y: mosaicArrowDim ? 5 : -10)
                            .animation(.easeInOut(duration: 1.0))
                    }
                    .onAppear() {
                        mosaicArrowDim = true
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text(String.covertMMDate(timeStamp: model.music.showDate))
                                .font(.customAlfa(size: 10))
                                .foregroundColor(.white)
                            Text("|")
                                .font(.customAlfa(size: 12))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                            Text(String.timeStampToWeekday(timeStamp: model.music.showDate))
                                .font(.customAlfa(size: 10))
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding(.top,5)
                    .padding(.leading,10)
                    
                    Spacer()
                    
                    VStack {
                        ZStack(alignment: .center) {
                            Image("music_year_box")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 20)
                            Text(String.timeStampToString(timeStamp: model.music.showDate ,dateFormat: "yyyy"))
                                .font(.customAlfa(size: 10))
                                .fontWeight(.black)
                                .foregroundColor(Color.init(hex: model.titleColor))
                        }
                        .padding(.trailing,-10)
                        Spacer()
                    }
                }
                .frame(idealHeight: 120)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 10)
                .padding(.leading,30)
                .padding(.bottom,0)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(model.music.bandName)
                            .font(.customAlfa(size: 32))
                            .lineLimit(2)
                            .foregroundColor(.white)
                        Text(model.music.bandInfo)
                            .font(.customAlfa(size: 12))
                            .padding(.top,20)
                            .lineSpacing(8)
                            .foregroundColor(Color.init(hex: model.contenColor))
                    }
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom,40)
                    Spacer()
                }
    
                HStack(alignment: .center) {
                    ZStack {
                        Image("music_vinyl")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 94, height: 100)
                            .padding(.trailing, -108)
                            .offset(x: mosaicArrowDim ? 0 : -30)
                            .animation(.easeInOut(duration: 1.0))
                        
                        KFImage(URL.init(string: (model.music.albums.first?.bigCover ?? "")))
                            .placeholder({
                                Image(systemName: "album_cover1")
                            })
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80, height: 80)
                        
                    }.frame(width: 134, height: 100 ,alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text(model.music.albums.first?.name ?? "")
                            .font(.customAlfa(size: 14))
                            .foregroundColor(.white)
                        Text("\(String.timeStampToString(timeStamp: model.music.albums.first?.pubdate ?? 1628423914,dateFormat: "yyyy"))／\(model.music.albums.first?.place ?? "")／\(model.music.albums.first?.style ?? "")")
                            .font(.customAlfa(size: 10))
                            .padding(.top,5)
                            .lineLimit(1)
                            .foregroundColor(Color.init(hex: model.contenColor))
                        Text(model.music.albums.first?.appraise ?? "")
                            .font(.customAlfa(size: 10))
                            .fontWeight(.black)
                            .padding(.top,5)
                            .foregroundColor(Color.init(hex: model.contenColor))
                    }
                    .padding(.leading,10)
                    Spacer()
                }
                .padding(.leading,30)
                .padding(.trailing,30)
                .frame(idealHeight: 100)
                .fixedSize(horizontal: false, vertical: true)
                
                VStack(alignment: .leading) {
                    Image("music_quotes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 20, alignment: .leading)
                        .padding(.bottom,20)
                    
                    Text(model.music.albums.first?.description ?? "")
                        .font(.customAlfa(size: 12))
                        .lineSpacing(8)
                        .foregroundColor(Color.init(hex: model.contenColor))
                    
                    HStack {
                        Text("—")
                            .font(.customAlfa(size: 12))
                            .fontWeight(.black)
                            .foregroundColor(Color.init(hex: 0x808080))
                        Text(model.music.albums.first?.author ?? "")
                            .font(.customAlfa(size: 12))
                            .fontWeight(.black)
                            .foregroundColor(Color.init(hex: model.titleColor))
                    }
                    .padding(.top,20)
                    .padding(.bottom,40)
                    
                    ZStack(alignment: .leading) {
                        Button(action: {
                            print("点击来")
                            UIPasteboard.general.setValue("Hello,World!", forPasteboardType: kUTTypePlainText as String)
                        }){
                            HStack {
                                Image("music_share_copy")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 22, height: 24, alignment: .leading)
                                
                                Text(model.music.albums.first?.recommend.name ?? "")
                                    .font(.customAlfa(size: 12))
                                    .fontWeight(.black)
                                    .padding(.leading, 10)
                                    .foregroundColor(Color.init(hex: model.contenColor))
                                Spacer()
                            }
                            .padding(.leading, 20)
                        }
                        .frame(height: 40)
                        .background(Color.init(hex: 0x2F2121))
                        .cornerRadius(20)
                    }
                    .frame(height: 40)
                    
                    HStack {
                        Image("music_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .leading)
                        
                        Spacer()
                        Text("zuokeinc@163.com")
                            .font(.system(size: 10))
                            .fontWeight(.black)
                            .foregroundColor(Color.init(hex: model.contenColor))
                        
                        Spacer()
                        Button(action: {
                            print("点击来")
                        }) {
                            Image("music_share_btn")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40, alignment: .leading)
                        }
                    }
                    .padding(.top,60)
                    .padding(.bottom,30)
                }
                .padding(.top,50)
                .padding(.leading,30)
                .padding(.trailing,30)
            }
        }
        .frame(width: screenW)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: 0x201717), Color.init(hex: 0x201717)]), startPoint: .top, endPoint: .bottom)
        ).edgesIgnoringSafeArea(.all)
    }
}

struct MusicDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            let model = MusicViewModel(music: MusicList())
//            MusicDetail(model:model).environment(\.colorScheme, .dark)
//                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
