//
//  LWMusicApp.swift
//  Shared
//
//  Created by vvusu on 6/8/21.
//

import SwiftUI

//@main
struct LWMusicApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let store = Store()
    
    var body: some Scene {
        WindowGroup {
            MusicList().environmentObject(store)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    print("App进入后台")
                })
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                    print("App返回前台")
                })
                .onAppear {
                    self.store.dispatch(.loadMusicList)
                }
        }
    }
}
