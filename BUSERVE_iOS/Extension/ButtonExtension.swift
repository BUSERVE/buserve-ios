//
//  ButtonExtension.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/07/31.
//

import UIKit

extension UIButton.Configuration {
    enum BookmarkButtonStyle {
        case bookmarked
        case notBookmarked
        
        var title: String? {
            return "즐겨찾기"
        }
        
        var backgroundColor: UIColor? {
            return .Background
        }
        
        var textColor: UIColor? {
            switch self {
            case .bookmarked:
                return .SubColor
                
            case .notBookmarked:
                return .Secondary
            }
        }
        
        var strokeColor: UIColor? {
            switch self {
            case .bookmarked:
                return .SubColor
            case .notBookmarked:
                return .Tertiary
            }
        }
        
        var font: UIFont? {
            switch self {
            case .bookmarked:
                return .calloutBold
            case .notBookmarked:
                return .callout
            }
        }
        
        var image: UIImage? {
            switch self {
            case .bookmarked:
                let image = UIImage(systemName: "star.fill")
                image?.withTintColor(.SubColor, renderingMode: .alwaysOriginal)
                return image
            case .notBookmarked:
                let image = UIImage(systemName: "star")
                image?.withTintColor(.Secondary, renderingMode: .alwaysOriginal)
                return image
            }
        }
    }
    
    static func bookmarkButtonStyle(style: BookmarkButtonStyle) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = style.backgroundColor
        
        configuration.title = style.title
        configuration.image = style.image
        configuration.imagePadding = 8
        configuration.baseForegroundColor = style.textColor
        configuration.background.strokeColor = style.strokeColor
        configuration.background.strokeWidth = 1
        configuration.background.cornerRadius = 15
        
        
        var titleContainer = AttributeContainer()
        titleContainer.font = style.font
        
        configuration.attributedTitle = AttributedString("즐겨찾기", attributes: titleContainer)
        
        return configuration
    }
}
