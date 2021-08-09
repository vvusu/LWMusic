//
//  LWMusicWidget.swift
//  LWMusicWidget
//
//  Created by vvusu on 6/8/21.
//

import SwiftUI
import WidgetKit
import Intents

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date(), config: MusicWidgetConfig.createEmpty(name: ""))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WidgetEntry) -> ()) {
        let entry = WidgetEntry(date: Date(), config: MusicWidgetConfig.createEmpty(name: ""))
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let currentDate = Date()
        let updateDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)
        MusicWidgetRquest.request { (result) in
            let model: MusicWidgetConfig
            if case .success(let res ) = result {
                model = res
            } else {
                model = MusicWidgetConfig.createEmpty(name: "")
            }
            let entry = WidgetEntry.init(date: updateDate!, config: model)
            let timeLine = Timeline(entries: [entry], policy: .after(updateDate!))
            completion(timeLine)
        }
    }
}

struct WidgetEntry: TimelineEntry {
    let date: Date
    let config: MusicWidgetConfig?
    
    init(date: Date, config: MusicWidgetConfig? = nil) {
        self.date = date
        self.config = config
    }
}

struct LWMusicWidgetEntryView : View {
    var entry: Provider.Entry
    //针对不同尺寸的 Widget 设置不同的 View
    @Environment(\.widgetFamily) var family // 尺寸环境变量
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            MusicMiddleWidget(date: entry.date, config: entry.config!)
        case .systemMedium:
            MusicMiddleWidget(date: entry.date, config: entry.config!)
        case .systemLarge:
            MusicBigWidget(date: entry.date, config: entry.config!)
        @unknown default:
            MusicMiddleWidget(date: entry.date, config: entry.config!)
        }
    }
}

@main
struct LWMusicWidget: Widget {
    let kind: String = "MusicWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            LWMusicWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("音乐小组件")
        .description("添加小组件来显示乐队信息")
        .supportedFamilies([.systemMedium,.systemLarge])
    }
}

struct LWMusicWidget_Previews: PreviewProvider {
    static var previews: some View {
        LWMusicWidgetEntryView(entry: WidgetEntry(date: Date())).previewContext(WidgetPreviewContext(family: .systemMedium))
        LWMusicWidgetEntryView(entry: WidgetEntry(date: Date())).previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
