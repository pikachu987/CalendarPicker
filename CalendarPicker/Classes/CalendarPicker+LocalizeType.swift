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

import UIKit

public extension CalendarPicker {
    enum LocalizeType {
        case ko
        case jp
        case zh
        case en
        case `default`
        
        static func localize(locale: Locale?) -> LocalizeType {
            guard let locale = locale else { return .default }
            if locale.identifier.hasPrefix("ko") || locale.identifier.hasPrefix("kr") { return .ko }
            else if locale.identifier.hasPrefix("jp") || locale.identifier.hasPrefix("ja") { return .jp }
            else if locale.identifier.hasPrefix("zh") { return .zh }
            else if locale.identifier.hasPrefix("en") { return .en }
            else { return .default }
        }
        
        func dateArray(_ dateFormatType: DateFormatType) -> [DateType] {
            if dateFormatType == .default {
                switch self {
                case .ko, .jp, .zh: return [.year, .month, .day]
                case .en, .default: return [.month, .day, .year]
                }
            } else {
                switch self {
                case .ko, .jp, .zh: return [.year, .month]
                case .en, .default: return [.month, .year]
                }
            }
        }
        
        func width(dateType: DateType, isShowWeek: Bool) -> CGFloat {
            switch self {
            case .ko, .jp, .zh:
                if dateType == .year {
                    return 96
                } else if dateType == .month {
                    return 66
                } else {
                    if isShowWeek {
                        return 95
                    } else {
                        return 70
                    }
                }
            default:
                if dateType == .month {
                    return 132
                } else if dateType == .year {
                    return 76
                } else {
                    if isShowWeek {
                        return 75
                    } else {
                        return 49
                    }
                }
            }
        }
        
        func alignment(dateType: DateType) -> NSTextAlignment {
            switch self {
            case .ko, .jp, .zh:
                if dateType == .year {
                    return .center
                } else if dateType == .month {
                    return .left
                } else {
                    return .left
                }
            default:
                if dateType == .year {
                    return .center
                } else if dateType == .month {
                    return .left
                } else {
                    return .center
                }
            }
        }
        
        func dateIndex(_ dateType: DateType, dateFormatType: DateFormatType) -> Int {
            return self.dateArray(dateFormatType).firstIndex(where: { $0 == dateType }) ?? 0
        }
        
        func year(_ value: Int) -> String {
            switch self {
            case .ko: return "\(value + 1)년"
            case .jp, .zh: return "\(value + 1)年"
            case .en, .default: return "\(value + 1)"
            }
        }
        
        func month(_ value: Int) -> String {
            switch self {
            case .ko: return "\(value + 1)월"
            case .jp, .zh: return "\(value + 1)月"
            case .en, .default:
                let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                return "\(months[value])"
            }
        }
        
        func day(_ value: Int) -> String {
            switch self {
            case .ko: return "\(value + 1)일"
            case .jp, .zh: return "\(value + 1)日"
            case .en, .default: return "\(value + 1)"
            }
        }
    }

}
