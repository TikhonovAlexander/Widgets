//
//  NewsWidget.swift
//  ladder
//
//  Created by Tikhonov, Aleksandr on 18.01.21.
//

import Foundation

import WidgetKit
import SwiftUI

struct NewsProvider: TimelineProvider {
    func placeholder(in context: Context) -> NewsEntry {
        NewsEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (NewsEntry) -> ()) {
        let entry = NewsEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [NewsEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = NewsEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct NewsEntry: TimelineEntry {
    let date: Date
}

struct NewsWidgetEntryView : View {
    var entry: NewsProvider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct NewsWidget: Widget {
    let kind: String = "NewsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: NewsProvider()) { entry in
            NewsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("News Widget")
        .description("Last news.")
        .supportedFamilies([.systemSmall])
    }
}

struct NewsWidget_Previews: PreviewProvider {
    static var previews: some View {
        NewsWidgetEntryView(entry: NewsEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
