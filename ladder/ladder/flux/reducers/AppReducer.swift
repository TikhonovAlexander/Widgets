//
//  AppReducer.swift
//  ladder
//
//  Created by atikhonov on 25.08.2020.
//

import Foundation
import Combine

typealias Reducer<State, Action> = (inout State, Action) -> AnyPublisher<Action, Error>?

func appReducer(state: inout AppState, action: AppAction) -> AnyPublisher<AppAction, Error>? {
    switch action {
    case .profiles(let action):
        return profilesStateReducer(state: &state.profilesState, action: action)
    }
}
