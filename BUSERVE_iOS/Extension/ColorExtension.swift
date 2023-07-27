//
//  ColorExtension.swift
//  BUSERVE_iOS
//
//  Created by 정태우 on 2023/07/21.
//

import Foundation
import UIKit

extension UIColor {
    static let MainColor = UIColor(named: "MainColor") ?? UIColor(red: 18/255, green: 104/255, blue: 251/255, alpha: 1)
    static let SubColor = UIColor(named: "SubColor")
    static let Quaternary = UIColor(named: "Quaternary")
    static let Tertiary = UIColor(named: "Tertiary")
    static let Body = UIColor(named: "Body")
    static let Secondary = UIColor(named: "Secondary")
    static let Background = UIColor(named: "Background")
    static let SecondaryBackground = UIColor(named: "SecondaryBackground")
    
    // LoginView Color
    static let KakaoBackground = UIColor(named: "KakaoBackground") ?? UIColor(red: 255/255, green: 222/255, blue: 0/255, alpha: 1)
    static let GoogleBackground = UIColor(named: "GoogleBackground") ?? UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let AppleBackground = UIColor(named: "AppleBackground") ?? UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
}
