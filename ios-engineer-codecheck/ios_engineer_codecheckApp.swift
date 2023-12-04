//
//  ios_engineer_codecheckApp.swift
//  ios-engineer-codecheck
//
//  Created by yhoshida on 2023/12/04.
//

import SwiftUI
import ComposableArchitecture

@main
struct ios_engineer_codecheckApp: App {
    var body: some Scene {
        WindowGroup {
            SerchView(store: Store(initialState: SerchCore.State(), reducer: SerchCore()))
        }
    }
}
