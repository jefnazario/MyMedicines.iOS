//
//  Schedule.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 08/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation

class Schedule: IDomain {
    @objc dynamic var medicineName: String?
    @objc dynamic var takeVia: String = ""
    @objc dynamic var startDate: String = ""
    @objc dynamic var startHour: String = ""
    @objc dynamic var interval: Int = 0
    @objc dynamic var intervalType: IntervalType = .hour
    @objc dynamic var pacientName: String = ""
    @objc dynamic var customColor: Int = 0
}

@objc enum IntervalType: NSInteger {
    case minute
    case hour
    case day
    case week
    case halfMonth
    case month
}

struct BackgroundButtons {
    static let red: Int = Int(0xFF2600)
    static let purple: Int = Int(0x942193)
    static let blue: Int = Int(0x0433FF)
    static let greenBlue: Int = Int(0x009193)
    static let orange: Int = Int(0xFF9300)
    static let green: Int = Int(0x08D77A)
    static let pink: Int = Int(0xFF40FF)
    
    static let bgs = [BackgroundButtons.red, BackgroundButtons.purple, BackgroundButtons.blue, BackgroundButtons.greenBlue, BackgroundButtons.orange, BackgroundButtons.green, BackgroundButtons.pink]
}
