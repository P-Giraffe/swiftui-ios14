//
//  EmojiRangerWidgetPurple.swift
//  EmojiRangerWidgetPurple
//
//  Created by Maxime Britto on 15/12/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> RangerEntry {
        return RangerEntry(date: Date(), ranger: .panda)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (RangerEntry) -> ()) {
        let entry = RangerEntry(date: Date(), ranger: .egghead)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [RangerEntry] = [RangerEntry(date: Date(), ranger: .egghead)]
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct RangerEntry: TimelineEntry {
    let date: Date
    let ranger: CharacterDetail
}

struct EmojiRangerWidgetPurpleEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    var body: some View {
        switch family {
        case .systemSmall:
            AvatarView(entry.ranger)
                .widgetURL(entry.ranger.url)
        default:
            AvatarView(entry.ranger)
                .background(Color.gameWidgetBackground)
                .widgetURL(entry.ranger.url)
        }
        
    }
}

@main
struct EmojiRangerWidgetPurple: Widget {
    let kind: String = "EmojiRangerWidgetPurple"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            EmojiRangerWidgetPurpleEntryView(entry: entry)
        }
        .configurationDisplayName("Emoji Ranger")
        .description("Suivez vos ranger en temps réel.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct EmojiRangerWidgetPurple_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiRangerWidgetPurpleEntryView(entry: RangerEntry(date: Date(), ranger: .spouty))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            EmojiRangerWidgetPurpleEntryView(entry: RangerEntry(date: Date(), ranger: .spouty))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .redacted(reason: .placeholder)
            EmojiRangerWidgetPurpleEntryView(entry: RangerEntry(date: Date(), ranger: .panda))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
        
    }
}
