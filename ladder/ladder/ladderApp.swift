//
//  ladderApp.swift
//  ladder
//
//  Created by Tikhonov, Aleksandr on 29.10.20.
//

import SwiftUI

@main
struct ladderApp: App {

    @StateObject var appStore = AppStore(state: .init(), reducer: appReducer(state:action:))

    var body: some Scene {
        WindowGroup {
            ProfileListView()
                .environmentObject(appStore)
        }
    }
}
