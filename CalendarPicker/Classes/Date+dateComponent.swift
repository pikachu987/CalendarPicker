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

extension Date {
    var dateComponent: DateComponent {
        var component = DateComponent()
        let calendar = Calendar.current
        component.year = (calendar as NSCalendar).components(.year, from: self).year ?? 0
        component.month = (calendar as NSCalendar).components(.month, from: self).month ?? 0
        component.day = (calendar as NSCalendar).components(.day, from: self).day ?? 0
        component.hour = (calendar as NSCalendar).components(.hour, from: self).hour ?? 0
        component.minute = (calendar as NSCalendar).components(.minute, from: self).minute ?? 0
        component.second = (calendar as NSCalendar).components(.second, from: self).second ?? 0
        return component
    }
}
