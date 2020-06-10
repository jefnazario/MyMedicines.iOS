//
//  UITextFieldExtensions.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 09/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

extension UITextField {
    func toNext() {
        let nextTag = self.tag + 1
        let nextResponder = self.superview?.superview?.superview?.viewWithTag(nextTag)
        
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            self.resignFirstResponder()
        }
    }
}
