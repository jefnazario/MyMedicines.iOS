//
//  UIStoryboardExtensions.swift
//  MyMedicines
//
//  Created by Jeferson Nazario on 01/07/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardLoadable {
    static func storyboardName() -> String
    static func storyboardIdentifier() -> String
}

extension StoryboardLoadable where Self: UIViewController {
    static func storyboardName() -> String {
        return String(describing: Self.self).replacingOccurrences(of: "ViewController", with: "")
    }
    
    static func storyboardIdentifier() -> String {
        return String(describing: Self.self)
    }
}

extension UIStoryboard {
    static func loadViewController<T>() -> T where T: StoryboardLoadable, T: UIViewController {
        return UIStoryboard(name: T.storyboardName(), bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier()) as! T
    }
}
