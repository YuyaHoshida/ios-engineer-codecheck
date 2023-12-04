//
//  ContentView.swift
//  ios-engineer-codecheck
//
//  Created by yhoshida on 2023/12/04.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<ContentCore>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("hello")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(initialState: ContentCore.State(), reducer: ContentCore()))
    }
}
