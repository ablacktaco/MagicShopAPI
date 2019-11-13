//
//  SettingButtonProperties.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/7.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

struct BorderProperties {
    
    static let homePageButton = BorderProperties(cornerRadius: 10, borderWidth: 2)
    static let purchaseButton = BorderProperties(cornerRadius: 5, borderWidth: 0.5)
    static let mainViewBorder = BorderProperties(borderWidth: 4)
    static let viewBorder = BorderProperties(borderWidth: 2)
    static let cellBorder = BorderProperties(borderWidth: 1)
    
    var cornerRadius: Double = 0
    var bordercolor: CGColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var borderWidth: Double = 0
    
}

// DI
func setViewBorder(view: UIView, configSetting: BorderProperties) {
    view.layer.cornerRadius = CGFloat(configSetting.cornerRadius)
    view.layer.borderColor = configSetting.bordercolor
    view.layer.borderWidth = CGFloat(configSetting.borderWidth)
    view.clipsToBounds = true
}

