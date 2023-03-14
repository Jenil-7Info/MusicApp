//
//  DateComponentsformater+extension.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 14/03/23.
//

import Foundation

extension DateComponentsFormatter {
    static var abbeviedted: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
    }

    static var position: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad 
        return formatter
    }
}
