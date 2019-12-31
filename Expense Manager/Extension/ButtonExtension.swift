//
//  ButtonExtension.swift
//  Expense Manager
//
//  Created by Md Sifat on 12/30/19.
//  Copyright © 2019 Md Sifat. All rights reserved.
//

import UIKit

extension UIButton{
    
func designButton(borderWidth: CGFloat = 1, borderColor: UIColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)){
    
    layer.cornerRadius = frame.height / 2
    clipsToBounds = true
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor.cgColor
    }
}
