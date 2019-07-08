//
//  ViewController.swift
//  CalendarPicker
//
//  Created by pikachu987 on 07/08/2019.
//  Copyright (c) 2019 pikachu987. All rights reserved.
//

import UIKit
import CalendarPicker

class ViewController: UIViewController {
    @IBOutlet private weak var pickerContainerView: UIView!
    @IBOutlet private weak var minimumLabel: UILabel!
    @IBOutlet private weak var maximumLabel: UILabel!
    
    private let calendarPicker: CalendarPicker = {
        return CalendarPicker()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.calendarPicker.delegate = self
        self.pickerContainerView.addSubview(calendarPicker)
        self.calendarPicker.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        let dateCompontnt = self.calendarPicker.selectedDateComponent
        self.title = "\(dateCompontnt.yearString)-\(dateCompontnt.monthString)-\(dateCompontnt.dayString)(\(dateCompontnt.week?.valueShort(self.calendarPicker.localeType) ?? ""))"
        
        let leftBarButtonItem = UIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(self.todayTap(_:)))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(self.selectTap(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func todayTap(_ sender: UIBarButtonItem) {
        self.calendarPicker.setDate(Date(), animated: true)
    }
    
    @objc private func selectTap(_ sender: UIBarButtonItem) {
        let dateCompontnt = self.calendarPicker.selectedDateComponent
        self.title = "\(dateCompontnt.yearString)-\(dateCompontnt.monthString)-\(dateCompontnt.dayString)(\(dateCompontnt.week?.valueShort(self.calendarPicker.localeType) ?? ""))"
    }
    
    
    
    @IBAction private func localeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.calendarPicker.localeType = .en
        } else if sender.selectedSegmentIndex == 1 {
            self.calendarPicker.localeType = .ko
        } else if sender.selectedSegmentIndex == 2 {
            self.calendarPicker.localeType = .jp
        } else if sender.selectedSegmentIndex == 3 {
            self.calendarPicker.localeType = .zh
        } else if sender.selectedSegmentIndex == 4 {
            self.calendarPicker.localeType = .default
        }
    }
    
    @IBAction private func miniumChanged(_ sender: UISlider) {
        let date = Date().addingTimeInterval(-60*60*24*TimeInterval(sender.value))
        self.minimumLabel.text = "minimumDate - \(date)"
        self.calendarPicker.minimumDate = date
    }
    
    @IBAction private func maximumChanged(_ sender: UISlider) {
        let date = Date().addingTimeInterval(60*60*24*TimeInterval(sender.value))
        self.maximumLabel.text = "maximumDate - \(date)"
        self.calendarPicker.maximumDate = date
    }
    
    @IBAction func weekChanged(_ sender: UISwitch) {
        self.calendarPicker.isShowWeek = sender.isOn
    }
}

// MARK: CalendarPickerDelegate
extension ViewController: CalendarPickerDelegate {
    func calendarPickerSelectDate(_ dateCompontnt: DateComponent) {
        self.title = "\(dateCompontnt.yearString)-\(dateCompontnt.monthString)-\(dateCompontnt.dayString)(\(dateCompontnt.week?.valueShort(self.calendarPicker.localeType) ?? ""))"
    }
}
