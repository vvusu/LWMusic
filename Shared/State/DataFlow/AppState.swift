//
//  AppState.swift
//  PokeMaster
//
//  Created by Wang Wei on 2019/08/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation
import Combine

struct AppState {
    var musicList = MusicList()
    var settings = Settings()
    var mainTab = MainTab()
}

extension AppState {
    struct Settings {
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }

        enum AccountBehavior: CaseIterable {
            case register, login
        }

        class AccountChecker {
            @Published var accountBehavior = AccountBehavior.login
            @Published var email = ""
            @Published var password = ""
            @Published var verifyPassword = ""

            var isEmailValid: AnyPublisher<Bool, Never> {
                let emailLocalValid = $email.map { $0.isValidEmailAddress }
                let canSkipRemoteVerify = $accountBehavior.map { $0 == .login }
                let remoteVerify = $email
                    .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
                    .removeDuplicates()
                    .flatMap { email -> AnyPublisher<Bool, Never> in
                        let validEmail = email.isValidEmailAddress
                        let canSkip = self.accountBehavior == .login
                        switch (validEmail, canSkip) {
                        case (false, _):
                            return Just(false).eraseToAnyPublisher()
                        case (true, false):
                            return EmailCheckingRequest(email: email)
                                .publisher
                                .eraseToAnyPublisher()
                        case (true, true):
                            return Just(true).eraseToAnyPublisher()
                        }
                    }
                return Publishers.CombineLatest3(
                        emailLocalValid, canSkipRemoteVerify, remoteVerify
                    )
                    .map { $0 && ($1 || $2) }
                    .eraseToAnyPublisher()
            }

            var isValid: AnyPublisher<Bool, Never> {
                isEmailValid
                    .combineLatest($accountBehavior, $password, $verifyPassword)
                    .map { validEmail, accountBehavior, password, verifyPassword -> Bool in
                        guard validEmail && !password.isEmpty else {
                            return false
                        }
                        switch accountBehavior {
                        case .login:
                            return true
                        case .register:
                            return password == verifyPassword
                        }
                    }
                    .eraseToAnyPublisher()
            }
        }

        var checker = AccountChecker()
        var isValid: Bool = false
        var isEmailValid: Bool = false
        var showEnglishName = true
        var showFavoriteOnly = false
        var sorting = Sorting.id
        var registerRequesting = false
        var loginRequesting = false
        var showingAccountBehaviorIndicator: Bool { registerRequesting || loginRequesting }

        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser: User?
        var loginError: AppError?
    }
}

extension AppState {
    struct MusicList {
        var page = 1
        var pageSize = 20
        var selectionRow = 0
        var loadmore = false
        var loadingMusics = false
        var showTextInfo = false
        var savePhotoSuccess = false
        var showMusicShare = false
        var musicLoadingError: AppError?
        var dataList: [MusicViewModel] = []
        
        func displayMusic(with settings: Settings) -> [MusicViewModel] {
            let sortFunc: (MusicViewModel, MusicViewModel) -> Bool
            switch settings.sorting {
            case .id:
                sortFunc = { $0.id < $1.id }
            default:
                sortFunc = { $0.id < $1.id }
            }
            return dataList.sorted(by: sortFunc);
        }
    }
}

extension AppState {
    struct MainTab {
        enum Index: Hashable {
            case list, settings
        }
        var selection: Index = .list
    }
}
