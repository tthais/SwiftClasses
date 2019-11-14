//
//  Model.swift
//  SPM
//
//  Created by Thais Costa on 13/11/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import Foundation
import BaseNetworkKit

struct Model: NKCodable {
  let launchYear: String

  enum CodingKeys: String, CodingKey {
    case launchYear = "launch_year"
  }
}
