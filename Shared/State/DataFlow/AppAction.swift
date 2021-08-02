//
//  AppAction.swift
//  PokeMaster
//
//  Created by Wang Wei on 2019/08/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation

enum AppAction {
    // Settings
    case accountBehaviorButton(enabled: Bool)
    case accountBehaviorDone(result: Result<User, AppError>)
    case emailValid(valid: Bool)
    case register(email: String, password: String)
    case login(email: String, password: String)
    case logout
    case clearCache

    // Music List
    case toggleListSelection(index: Int?)
    case togglePanelPresenting(presenting: Bool)
    case toggleFavorite(index: Int)
    case closeSafariView
    case loadMusicList
    case loadMusicListDone(result: Result<[MusicViewModel], AppError>)
    
    // General
    case switchTab(index: AppState.MainTab.Index)
}
