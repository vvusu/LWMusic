//
//  DateHelper.swift
//  LWMusic
//
//  Created by vvusu on 8/3/21.
//

import Foundation

extension String {
    //转换为时间
    static func timeStampToString(timeStamp:Double) -> String {
        let timeInterval:TimeInterval = TimeInterval(timeStamp/1000)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale.current
        dateformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss" //自定义日期格式
        let time = dateformatter.string(from: date)
        return time
    }
    
    static func timeStampToString(timeStamp:Double, dateFormat:String) -> String {
        let timeInterval:TimeInterval = TimeInterval(timeStamp/1000)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale.current
        if !dateFormat.isEmpty {
            dateformatter.dateFormat = dateFormat
        } else {
            dateformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        }
        let time = dateformatter.string(from: date)
        return time
    }
    
    static func covertMMDate(timeStamp:Double) -> String {
        let number = Int(timeStampToString(timeStamp: timeStamp,dateFormat:"MM"))!
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "zh_CN")
        numberFormatter.numberStyle = NumberFormatter.Style.spellOut
        let numberStr = numberFormatter.string(from: NSNumber(value: number)) ?? ""
        return "\(numberStr)月"
    }
    
    // 获取星期日期
    static func timeStampToWeekday(timeStamp:Double) -> String {
        let timeInterval:TimeInterval = TimeInterval(timeStamp/1000)
        let date = Date(timeIntervalSince1970: timeInterval)
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: date)
        switch weekDay {
        case 1:
            return "周日"
        case 2:
            return "周一"
        case 3:
            return "周二"
        case 4:
            return "周三"
        case 5:
            return "周四"
        case 6:
            return "周五"
        case 7:
            return "周六"
        default:
            return ""
        }
    }
}
