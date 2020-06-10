//
//  UILabelExtensions.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 02/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import UIKit

extension UILabel {
    class func emptyMessage() -> UILabel {
        let label = UILabel()
        label.text = "Nenhum item adicionado"
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }
}
