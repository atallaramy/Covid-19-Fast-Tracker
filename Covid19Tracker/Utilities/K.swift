//
//  K.swift
//  Covid19Tracker
//
//  Created by Ramy Atalla on 2020-04-13.
//  Copyright © 2020 Ramy Atalla. All rights reserved.
//

import UIKit

enum SFSymbols {
    static let newCases       = UIImage(systemName: "plus.square.fill")
    static let activeCases    = UIImage(systemName: "bed.double.fill")
    static let criticalCases  = UIImage(systemName: "waveform.path.ecg")
    static let recoveredCases = UIImage(systemName: "bandage.fill")
    static let totalCases     = UIImage(systemName: "person.3.fill")
    
    static let newDeaths      = UIImage(systemName: "plus.square.fill")
    static let totalDeaths    = UIImage(systemName: "person.3.fill")
    
    static let totalTests     = UIImage(systemName: "person.crop.circle.fill.badge.checkmark")
}

enum Cells {
    static let countryCell = "CountryCell"
}

enum ScreenSize {
    static let width                    = UIScreen.main.bounds.size.width
    static let height                   = UIScreen.main.bounds.size.height
    static let maxLength                = max(ScreenSize.width, ScreenSize.height)
    static let minLength                = min(ScreenSize.width, ScreenSize.height)
}

enum Images {
    static let emptyStateLogo           = UIImage(named: "covid-19-4959887_1280")
}

enum DeviceTypes {
    static let idiom                    = UIDevice.current.userInterfaceIdiom
    static let nativeScale              = UIScreen.main.nativeScale
    static let scale                    = UIScreen.main.scale
    
    static let isiPhoneSE               = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard        = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed          = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard    = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed      = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX                = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr       = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad                   = idiom == .pad && ScreenSize.maxLength >= 1024.0
    
    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}
