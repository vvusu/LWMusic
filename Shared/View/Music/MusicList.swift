//
//  MusicList.swift
//  LWMusic (iOS)
//
//  Created by vvusu on 7/12/21.
//

import SwiftUI

struct MusicList: View {

    @EnvironmentObject var store: Store

//    var pokemonList: AppState.MusicList { store.appState.musicList }
//
    var body: some View {
        ScrollView {
//            LazyVStack {
//                TextField("搜索", text: $store.appState.pokemonList.searchText.animation(nil))
//                    .frame(height: 40)
//                    .padding(.horizontal, 25)
//                ForEach(pokemonList.displayPokemons(with: store.appState.settings)) { pokemon in
//                    MusicRow(
//                        model: pokemon,
//                        expanded: self.pokemonList.selectionState.isExpanding(pokemon.id)
//                    )
//                    .onTapGesture {
//                        withAnimation(.spring(response: 0.55, dampingFraction: 0.425, blendDuration: 0)) {
//                            self.store.dispatch(.toggleListSelection(index: pokemon.id))
//                        }
//                        self.store.dispatch(.loadAbilities(pokemon: pokemon.pokemon))
//                    }
//                }
//            }
//            Spacer()
//                .frame(height: 8)
        }
    }
}
