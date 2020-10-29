//
//  AppGroup.swift
//  ladder
//
//  Created by Tikhonov, Aleksandr on 28.09.20.
//

import Foundation

public enum AppGroup: String {
    case facts = "group.com.uninova.ladderprofiles"

    public var containerURL: URL {
        switch self {
        case .facts:
            return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: self.rawValue)!
        }
    }
}
