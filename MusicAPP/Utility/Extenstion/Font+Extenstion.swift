//
//  Font+Extenstion.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import Foundation
import SwiftUI

//MARK: - Dynamic Custom Font...
//let screenWidth                                 =  UIScreen.main.bounds.size.width
//let screenHeight                                =  UIScreen.main.bounds.size.height
//let kHeightAspectRasio                          = (screenHeight/568) < 1 ? (screenHeight/480) : (screenHeight/568)
//let kWidthAspectRasio                           = (screenWidth/320)  < 1 ? (screenWidth/320) : (screenWidth/320)
//var kRatio                                      = "kRatio"
//
//var kFontAspectRatio : CGFloat {
//    if UIDevice().userInterfaceIdiom == .pad {
//        return screenHeight / 568
//    }
//    return screenWidth / 320
//}

//MARK: - Custom Font Name...
enum FontName: String {
    case FesterTrialRegualer = "Fester_Trial-Regular"
    case FesterTrialRegualerItalic = "Fester_Trial-RegularItalic"
    case FesterTrialThin = "Fester_Trial-Thin"
    case FesterTrialThinItalic = "Fester_Trial-ThinItalic"
    case FesterTrialExtraLight = "Fester_Trial-ExtraLight"
    case FesterTrialExtraLightItalic = "Fester_Trial-ExtraLightItalic"
    case FesterTrialLight = "Fester_Trial-Light"
    case FesterTrialLightItalic = "Fester_Trial-LightItalic"
    case FesterTrialBook = "Fester_Trial-Book"
    case FesterTrialBookItalic = "Fester_Trial-BookItalic"
    case FesterTrialSemiBold = "Fester_Trial-SemiBold"
    case FesterTrialSemiBoldItalic = "Fester_Trial-SemiBoldItalic"
    case FesterTrialBold = "Fester_Trial-Bold"
    case FesterTrialHeavy = "Fester_Trial-BoldItalic"
    case FesterTrialHeavyItalic = "Fester_Trial-Heavy"
    case FesterMedium = "Futura-Medium"
    case FesterMediumItalic = "Futura-MediumItalic"
    case FesterBold = "Futura-Bold"
    case FesterCondensedMedium = "Futura-CondensedMedium"
    case FesterCondensedExtraBold = "Futura-CondensedExtraBold"
}

//MARK: - Extenstion Font...
extension Font {
    static func festerFont(customFontName : FontName, fontSize : CGFloat) -> Font {
        return Font.custom(customFontName.rawValue, size: fontSize)
    }
}
