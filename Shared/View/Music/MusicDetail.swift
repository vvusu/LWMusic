//
//  MusicRow.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 7/12/21.
//

import SwiftUI
import Kingfisher

struct MusicDetail: View {
    let titleColor = 0xCCCCCC;
    let contenColor = 0xB3B3B3;
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ZStack {
                    KFImage(URL.init(string: "https://static.runoob.com/images/demo/demo2.jpg"))
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*(600/750))
                }
                HStack(alignment: .top) {
                    VStack(alignment: .center) {
                        Text("09")
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                        Image("music_mosaic_arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 21)
                            .padding(.top, -5)
                    }
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text("七月")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                            Text("周五")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }.padding(.top,5).padding(.leading,10)
                    Spacer()
                    VStack {
                        ZStack(alignment: .center) {
                            Image("music_year_box")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 20)
                            Text("2021")
                                .font(.system(size: 10))
                                .fontWeight(.black)
                                .foregroundColor(Color.init(hex: 0xCCCCCC))
                        }.padding(.trailing,-10)
                        Spacer()
                    }
                }.padding(.top, 10).padding(.leading,30)
                
                VStack(alignment: .leading) {
                    Text("The Heliocentrics")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                    Text("伦敦迷幻爵士乐队太阳中心主义者起源于90年代，当时鼓手马尔科姆·卡托为莫瓦克斯和爵士乐演奏。并与埃西奥爵士先驱Mulatu Astatke等传奇人物的合作闻名。")
                        .padding(.top,20)
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(hex: contenColor))
                }.padding(.leading,30).padding(.top,0).padding(.trailing,30)
                HStack {
                    ZStack {
                        Image("music_vinyl")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 94, height: 100)
                            .padding(.trailing, -108)
                        KFImage(URL.init(string: "https://static.runoob.com/images/demo/demo3.jpg"))
                            .resizable()
                            .frame(width:80, height: 80)
                        
                    }.frame(minWidth: 134, idealWidth: 134, maxWidth: 134, minHeight: 100, idealHeight: 100, maxHeight:100, alignment: .leading)
                    VStack(alignment: .leading) {
                        Text("Infinity Of Now")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        Text("2009／英国／Psychedelic Jazz Funk")
                            .font(.system(size: 10))
                            .padding(.top,5)
                            .foregroundColor(Color.init(hex: contenColor))
                        Text("🗿🗿🗿🗿")
                            .font(.system(size: 10))
                            .fontWeight(.black)
                            .padding(.top,5)
                            .foregroundColor(Color.init(hex: contenColor))
                    }.padding(.leading,10)
                }.padding(.top, 50).padding(.leading,30).padding(.trailing,30)
                
                VStack(alignment: .leading) {
                    Image("music_quotes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 20, alignment: .leading)
                    Text("也就是在那儿，Fela 找到了属於自己独有的音乐节奏 : Afro-Beat，特殊的非洲节奏成为 Fela 的招牌，歌中他发展了黑人文化和非洲文化，鼓吹子民回归传统非洲文化的论调在当时备受瞩目，他在当地发行几张单曲有不错的迴响。成为 Fela 的招牌。")
                        .padding(.top,20)
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(hex: contenColor))
                    HStack {
                        Text("Sakamoto Shintaro")
                            .font(.system(size: 12))
                            .fontWeight(.black)
                            .foregroundColor(Color.init(hex: contenColor))
                    }.padding(.top,20)
                    HStack {
                        Image("music_share_copy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 24, alignment: .leading)
                        Text("Elephant Walk")
                            .font(.system(size: 12))
                            .fontWeight(.black)
                            .foregroundColor(Color.init(hex: contenColor))
                    }.padding(.top,40)
                    HStack {
                        Image("music_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .leading)
                        Spacer()
                        Text("zuokeinc@163.com")
                            .font(.system(size: 10))
                            .fontWeight(.black)
                            .foregroundColor(Color.init(hex: contenColor))
                        Spacer()
                        Image("music_share_btn")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .leading)
                    }.padding(.top,60).padding(.bottom,30)
                }.padding(.leading,30).padding(.trailing,30).padding(.top,50)
            }
        }.background(
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: 0x201717), Color.init(hex: 0x201717)]), startPoint: .top, endPoint: .bottom)
        ).edgesIgnoringSafeArea(.all)
    }
}

struct MusicDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicDetail().environment(\.colorScheme, .dark)
                .previewDevice("iPhone 12 Pro Max")
            MusicDetail().environment(\.colorScheme, .dark)
                .previewDevice("iPhone 12 Pro Max")
            MusicDetail().environment(\.colorScheme, .dark)
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
