//
//  UIToolBarExtensions.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 02/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector, with typeButtonSelection: Selector? = nil) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Selecionar", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        if let selection = typeButtonSelection {
            let typeButton = UIBarButtonItem(title: "Digitar", style: UIBarButtonItem.Style.plain, target: self, action: selection)
            toolBar.setItems([typeButton, spaceButton, doneButton], animated: false)
        } else {
            toolBar.setItems([spaceButton, doneButton], animated: false)
        }
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
}
