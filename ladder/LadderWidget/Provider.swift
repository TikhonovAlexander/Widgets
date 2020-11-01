//
//  Provider.swift
//  LadderWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 31.10.20.
//

import Foundation
import WidgetKit

struct LadderProvider: TimelineProvider {
    func placeholder(in context: Context) -> LadderEntry {
        LadderEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (LadderEntry) -> ()) {
        let entry = LadderEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<LadderEntry>) -> ()) {
        var entries: [LadderEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = LadderEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
