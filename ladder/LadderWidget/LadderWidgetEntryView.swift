//
//  LadderWidgetEntryView.swift
//  LadderWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 31.10.20.
//

import Foundation
import SwiftUI
import WidgetKit

struct LadderWidgetEntryView: View {
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

struct LadderWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LadderWidgetEntryView(entry: LadderEntry(date: Date(), profile: sampleProfile))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            LadderWidgetEntryView(entry: LadderEntry(date: Date(), profile: sampleProfile))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
