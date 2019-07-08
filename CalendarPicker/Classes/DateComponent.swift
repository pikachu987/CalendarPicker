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

public struct DateComponent {
    public var year: Int = 0
    public var month: Int = 0
    public var day: Int = 0
    public var hour: Int = 0
    public var minute: Int = 0
    public var second: Int = 0
    
    public var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormatter.date(from: "\(self.yearString)-\(self.monthString)-\(self.dayString) \(self.hourString):\(self.minuteString):\(self.secondString)")
    }
    
    public var week: Weekday? {
        guard let date = self.date else { return nil }
        let calendar = Calendar.current
        let week = (calendar as NSCalendar).components(.weekday, from: date).weekday ?? 0
        return Weekday.array[week - 1]
    }
    
    public var yearString: String {
        return "\(self.year)"
    }
    
    public var monthString: String {
        return self.month < 10 ? "0\(self.month)" : "\(self.month)"
    }
    
    public var dayString: String {
        return self.day < 10 ? "0\(self.day)" : "\(self.day)"
    }
    
    public var hourString: String {
        return self.hour < 10 ? "0\(self.hour)" : "\(self.hour)"
    }
    
    public var minuteString: String {
        return self.minute < 10 ? "0\(self.minute)" : "\(self.minute)"
    }
    
    public var secondString: String {
        return self.second < 10 ? "0\(self.second)" : "\(self.second)"
    }
    
    public init() { }
    
    mutating func reset() {
        self.year = 0
        self.month = 0
        self.day = 0
        self.hour = 0
        self.minute = 0
        self.second = 0
    }
    
    func equalYear(_ value: DateComponent?) -> Bool {
        guard let value = value else { return false }
        return self.year == value.year
    }
    
    func equalYearMonth(_ value: DateComponent?) -> Bool {
        guard let value = value else { return false }
        return self.year == value.year && self.month == value.month
    }
    
    func equalDate(_ value: DateComponent?) -> Bool {
        guard let value = value else { return false }
        return self.year == value.year && self.month == value.month && self.day == value.day
    }
    
    static func dateEqual(lhs: DateComponent, rhs: DateComponent) -> Bool {
        if lhs.year == rhs.year &&
            lhs.month == rhs.month &&
            lhs.day == rhs.day &&
            lhs.week == rhs.week &&
            lhs.yearString == rhs.yearString &&
            lhs.monthString == rhs.monthString &&
            lhs.dayString == rhs.dayString {
            return true
        } else {
            return false
        }
    }
    
    public static func ==(lhs: DateComponent, rhs: DateComponent) -> Bool {
        if lhs.year == rhs.year &&
            lhs.month == rhs.month &&
            lhs.day == rhs.day &&
            lhs.hour == rhs.hour &&
            lhs.minute == rhs.minute &&
            lhs.second == rhs.second {
            return true
        } else {
            return false
        }
    }
}
