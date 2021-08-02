//
//  Store.swift
//  PokeMaster
//
//  Created by Wang Wei on 2019/08/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Combine

class Store: ObservableObject {
    @Published var appState = AppState()
    private var disposeBag = Set<AnyCancellable>()
    
    init() {
        setupObservers()
    }

    func setupObservers() {
        appState.settings.checker.isValid.sink { isValid in
            self.dispatch(.accountBehaviorButton(enabled: isValid))
        }.store(in: &disposeBag)
        appState.settings.checker.isEmailValid.sink { isValid in
            self.dispatch(.emailValid(valid: isValid))
        }.store(in: &disposeBag)
    }

    func dispatch(_ action: AppAction) {
        print("[ACTION]: \(action)")
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            print("[COMMAND]: \(command)")
            command.execute(in: self)
        }
    }

    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        var appState = state
        var appCommand: AppCommand? = nil
        
        switch action {
        case .loadMusicList:
            if appState.musicList.loadingMusics {
                break
            }
            appState.musicList.musicLoadingError = nil
            appState.musicList.loadingMusics = true
            appCommand = LoadMusicListCommand()

        case .loadMusicListDone(let result):
            appState.musicList.loadingMusics = false
            switch result {
            case .success(let models):
                appState.musicList.musicList =
                    Dictionary(uniqueKeysWithValues: models.map { ($0.id, $0) })
            case .failure(let error):
                appState.musicList.musicLoadingError = error
            }
            
        case .accountBehaviorButton(let isValid):
            appState.settings.isValid = isValid

        case .emailValid(let isValid):
            appState.settings.isEmailValid = isValid

        case .register(let email, let password):
            appState.settings.registerRequesting = true
            appCommand = RegisterAppCommand(email: email, password: password)

        case .login(let email, let password):
            appState.settings.loginRequesting = true
            appCommand = LoginAppCommand(email: email, password: password)
        default:
            break
        }
        return (appState, appCommand)
    }
}
