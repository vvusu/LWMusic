//
//  MusicWidget.swift
//  LWMusic
//
//  Created by vvusu on 8/4/21.
//

import SwiftUI
import WidgetKit

protocol MusicWidget {
    
    static var musicName: String { get }
    
    var config: MusicWidgetConfig { get }

    init(date: Date, config widgetConfig: MusicWidgetConfig)
    
}
