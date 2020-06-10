//
//  UIButton.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 08/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

extension UIButton {
    func toCircle() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 0.5 * self.bounds.width
    }
}
