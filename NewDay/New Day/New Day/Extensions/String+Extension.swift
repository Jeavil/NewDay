//
//  String+Extension.swift
//  New Day
//
//  Created by ray on 28/02/2017.
//  Copyright © 2017 Jeavil. All rights reserved.
//

import Foundation

extension String {
    var urlString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? self
    }
}
