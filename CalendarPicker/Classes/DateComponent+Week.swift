//Copyright (c) 2019 pikachu987 <pikachu77769@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

import Foundation

public extension DateComponent {
    enum Weekday {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
        
        static var array: [Weekday] {
            return [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]
        }
        
        public func valueShort(_ value: CalendarPicker.LocalizeType) -> String {
            switch value {
            case .ko:
                switch self {
                case .monday: return "월"
                case .tuesday: return "화"
                case .wednesday: return "수"
                case .thursday: return "목"
                case .friday: return "금"
                case .saturday: return "토"
                case .sunday: return "일"
                }
            case .jp:
                switch self {
                case .monday: return "月"
                case .tuesday: return "火"
                case .wednesday: return "水"
                case .thursday: return "木"
                case .friday: return "金"
                case .saturday: return "土"
                case .sunday: return "日"
                }
            case .zh:
                switch self {
                case .monday: return "一"
                case .tuesday: return "二"
                case .wednesday: return "三"
                case .thursday: return "四"
                case .friday: return "五"
                case .saturday: return "六"
                case .sunday: return "天"
                }
            case .en, .default:
                switch self {
                case .monday: return "M"
                case .tuesday: return "T"
                case .wednesday: return "W"
                case .thursday: return "T"
                case .friday: return "F"
                case .saturday: return "S"
                case .sunday: return "S"
                }
            }
        }
        
        public func value(_ value: CalendarPicker.LocalizeType) -> String {
            switch value {
            case .ko:
                switch self {
                case .monday: return "월요일"
                case .tuesday: return "화요일"
                case .wednesday: return "수요일"
                case .thursday: return "목요일"
                case .friday: return "금요일"
                case .saturday: return "토요일"
                case .sunday: return "일요일"
                }
            case .jp:
                switch self {
                case .monday: return "月"
                case .tuesday: return "火"
                case .wednesday: return "水"
                case .thursday: return "木"
                case .friday: return "金"
                case .saturday: return "土"
                case .sunday: return "日"
                }
            case .zh:
                switch self {
                case .monday: return "星期一"
                case .tuesday: return "星期二"
                case .wednesday: return "星期三"
                case .thursday: return "星期四"
                case .friday: return "星期五"
                case .saturday: return "星期六"
                case .sunday: return "星期天"
                }
            case .en, .default:
                switch self {
                case .monday: return "Monday"
                case .tuesday: return "Tuesday"
                case .wednesday: return "Wenday"
                case .thursday: return "Thursday"
                case .friday: return "Friday"
                case .saturday: return "Saturday"
                case .sunday: return "Sunday"
                }
            }
        }
        
        public static func ==(lhs: Weekday, rhs: Weekday) -> Bool {
            switch (lhs, rhs) {
            case (.monday, .monday): return true
            case (.tuesday, .tuesday): return true
            case (.wednesday, .wednesday): return true
            case (.thursday, .thursday): return true
            case (.friday, .friday): return true
            case (.saturday, .saturday): return true
            case (.sunday, .sunday): return true
            default: return false
            }
        }
    }

}
