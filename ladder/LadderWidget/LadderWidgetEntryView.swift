//
//  LadderWidgetEntryView.swift
//  LadderWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 31.10.20.
//

import Foundation
import SwiftUI

struct LadderWidgetEntryView : View {
    var entry: LadderProvider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            ProfileInfoView(profile: entry.profile)
        default:
            ProfileView(profile: entry.profile)
        }
    }
}
