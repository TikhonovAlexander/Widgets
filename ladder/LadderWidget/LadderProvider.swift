//
//  LadderProvider.swift
//  LadderWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 31.10.20.
//

import Foundation
import WidgetKit

struct LadderProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> LadderEntry {
        LadderEntry(date: Date(), profile: sampleProfile)
    }

    func getSnapshot(for configuration: ProfileSelectionIntent, in context: Context, completion: @escaping (LadderEntry) -> ()) {
        let entry = LadderEntry(date: Date(), profile: sampleProfile)
        completion(entry)
    }

    func getTimeline(for configuration: ProfileSelectionIntent, in context: Context, completion: @escaping (Timeline<LadderEntry>) -> ()) {
        let entries: [LadderEntry] = [LadderEntry(date: Date(), profile: profile(for: configuration))]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

    func profile(for configuration: ProfileSelectionIntent) -> Profile {
        switch configuration.profile {
        case .lina:
        return Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")
        case .morphling:
        return Profile(id: 2, name: "Morphling", rating: 2, score: 218.8, imageName: "morphling")
        case .bloodseeker:
        return Profile(id: 1, name: "Bloodseeker", rating: 6, score: 312.1, imageName: "bloodseeker")
        case .unknown:
            return Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")
        }
    }
}
