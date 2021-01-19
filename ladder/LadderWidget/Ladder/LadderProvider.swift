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

    func getSnapshot(for configuration: DynamicProfileSelectionIntent, in context: Context, completion: @escaping (LadderEntry) -> ()) {
        if context.isPreview {
            let entry = LadderEntry(date: Date(), profile: sampleProfile)
            completion(entry)
        } else {
            // it takes a few seconds to fetch the data
            let profile = self.profile(for: configuration)
            let entry = LadderEntry(date: Date(), profile: profile)
            completion(entry)
        }
    }

    func getTimeline(for configuration: DynamicProfileSelectionIntent, in context: Context, completion: @escaping (Timeline<LadderEntry>) -> ()) {
        let profile = self.profile(for: configuration)
        var entries: [LadderEntry] = [LadderEntry(date: Date(), profile: profile)]

        let threeSeconds: TimeInterval = 3
        var currentDate = Date()
        let endDate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
        while currentDate < endDate {
            let newScore = Double.random(in: 150...200)
            let newProfile = Profile(id: profile.id, name: profile.name, rating: profile.rating, score: newScore, imageName: profile.imageName)
            let entry = LadderEntry(date: currentDate, profile: newProfile)
            entries.append(entry)
            currentDate += threeSeconds
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }


    func profile(for configuration: DynamicProfileSelectionIntent) -> Profile {
        let id = configuration.profileType?.identifier.flatMap { Int($0) } ?? 1
        switch id {
        case 3:
        return Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")
        case 2:
        return Profile(id: 2, name: "Morphling", rating: 2, score: 218.8, imageName: "morphling")
        case 1:
        return Profile(id: 1, name: "Bloodseeker", rating: 6, score: 312.1, imageName: "bloodseeker")
        default:
            return Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")
        }
    }
}
