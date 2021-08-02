//
//  AppCommand.swift
//  PokeMaster
//
//  Created by Wang Wei on 2019/08/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation
import Combine
import Kingfisher

protocol AppCommand {
    func execute(in store: Store)
}

struct RegisterAppCommand: AppCommand {
    let email: String
    let password: String

    func execute(in store: Store) {
        let token = SubscriptionToken()
        RegisterRequest(
            email: email,
            password: password
        ).publisher
        .sink(
            receiveCompletion: { complete in
                if case .failure(let error) = complete {
                    store.dispatch(.accountBehaviorDone(result: .failure(error)))
                }
                token.unseal()
            },
            receiveValue: { user in
                store.dispatch(.accountBehaviorDone(result: .success(user)))
            }
        ).seal(in: token)
    }
}

struct LoginAppCommand: AppCommand {
    let email: String
    let password: String

    func execute(in store: Store) {
        let token = SubscriptionToken()
        LoginRequest(
            email: email,
            password: password
        ).publisher
        .sink(
            receiveCompletion: { complete in
                if case .failure(let error) = complete {
                    store.dispatch(.accountBehaviorDone(result: .failure(error)))
                }
                token.unseal()
            },
            receiveValue: { user in
                store.dispatch(.accountBehaviorDone(result: .success(user)))
            }
        )
        .seal(in: token)
    }
}

struct LoadMusicListCommand: AppCommand {
    func execute(in store: Store) {
        let token = SubscriptionToken()
        LoadMusicRequest(
            page: 1
        ).musicPublisher
        .sink(
            receiveCompletion: { complete in
                if case .failure(let error) = complete {
                    store.dispatch(.loadMusicListDone(result: .failure(error)))
                }
                token.unseal()
            },
            receiveValue: { value in
                store.dispatch(.loadMusicListDone(result: .success(value)))
            }
        )
        .seal(in: token)
    }
}

struct ClearCacheCommand: AppCommand {
    func execute(in store: Store) {
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache()
    }
}

class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unseal() { cancellable = nil }
}

extension AnyCancellable {
    func seal(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
