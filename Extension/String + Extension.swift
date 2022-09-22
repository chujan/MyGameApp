//
//  String + Extension.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 19/09/2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
    var freegameURL: URL? {
        return URL(string: self)
    }
}
