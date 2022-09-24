//
//  UserDefaults+Extension.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 22/09/2022.
//

import Foundation
extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            
        }
    }
}

