//
//  LadderWidgetPlaceholderView.swift
//  LadderWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 08.11.20.
//

import Foundation
import SwiftUI
import WidgetKit

struct LadderWidgetPlaceholderView: View {
    var entry: LadderProvider.Entry

    var body: some View {
        LadderWidgetEntryView(entry: entry)
            .redacted(reason: .placeholder)
    }
}

struct LadderWidgetPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LadderWidgetPlaceholderView(entry: LadderEntry(date: Date(), profile: sampleProfile))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            LadderWidgetPlaceholderView(entry: LadderEntry(date: Date(), profile: sampleProfile))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
