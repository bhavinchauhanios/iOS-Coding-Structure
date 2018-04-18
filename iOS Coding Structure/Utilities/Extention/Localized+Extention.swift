//
//  String-Localized+Extention.swift
//  iOS Coding Structure
//
//  Created by WOS on 08/02/18.
//  Copyright © 2018 WOS. All rights reserved.
//

import Foundation

extension String {
  var localized: String {
    return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  }
}
