//
//  IntentHandler.swift
//  LWMusic
//
//  Created by vvusu on 8/4/21.
//

import Intents

//class IntentHandler: INExtension, MusicWidgetIntentHandling {
//    func provideCurrentWidgetOptionsCollection(for _: MusicWidgetIntent, with completion: @escaping (INObjectCollection<WidgetConfig>?, Error?) -> Void) {
//        let savedConfig = getSavedConfigKeys()
//        let widgetConfigs = savedConfig.enumerated().map { index, key in WidgetConfig(identifier: key, display: "小组件 \(index + 1)") }
//        let collection = INObjectCollection(items: widgetConfigs)
//
//        completion(collection, nil)
//    }
//
//    func defaultCurrentWidget(for _: ClocksWidgetIntent) -> WidgetConfig? {
//        let savedConfig = getSavedConfigKeys()
//        guard let lastConfigKey = savedConfig.last else {
//            return nil
//        }
//        return WidgetConfig(identifier: lastConfigKey, display: "小组件 \(savedConfig.count)")
//    }
//
//    override func handler(for _: INIntent) -> Any {
//        // This is the default implementation.  If you want different objects to handle different intents,
//        // you can override this and return the handler you want for that particular intent.
//
//        return self
//    }
//}
