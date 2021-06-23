//
//  LWMusicWidget.swift
//  LWMusicWidget
//
//  Created by vvusu on 6/8/21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct LWMusicWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
                Image("bg")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                Text(entry.date, style: .time)
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding(.top, 90)
        }
    }
}

@main
struct LWMusicWidget: Widget {
    let kind: String = "LWMusicWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            LWMusicWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("LW音乐")
        .description("音乐时尚新闻")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct LWMusicWidget_Previews: PreviewProvider {
    static var previews: some View {
        LWMusicWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
