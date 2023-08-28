//
//  WaterWidget.swift
//  WaterWidget
//
//  Created by Monica Vargas on 2022-12-03.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct WaterWidgetEntryView : View {
    var entry: Provider.Entry
    
    var fontStyle: Font {
        return .system(.footnote, design: .rounded)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BlueP"), Color("BlueT")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack {
                HStack {
                    Image("DropWater")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,
                               height: 100)
                }
                .foregroundColor(Color("BlueP"))
                Text("Keep hydrated!")
                    .foregroundColor(.blue)
                    .font(fontStyle)
                    .fontWeight(.bold)
            }
        }
        
    }
}

struct WaterWidget: Widget {
    let kind: String = "WaterWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WaterWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WaterWidget_Previews: PreviewProvider {
    static var previews: some View {
        WaterWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
