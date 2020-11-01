//
//  LadderWidget.swift
//  LadderWidget
//
//  Created by Tikhonov, Aleksandr on 29.10.20.
//

import WidgetKit
import SwiftUI

@main
struct LadderWidget: Widget {
    let kind: String = "LadderWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: LadderProvider()) { entry in
            LadderWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium, .systemSmall])
    }
}

struct LadderWidget_Previews: PreviewProvider {
    static var previews: some View {
        LadderWidgetEntryView(entry: LadderEntry(date: Date(), profile: sampleProfile))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
