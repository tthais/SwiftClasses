//
//  Service.swift
//  SPM
//
//  Created by Thais Costa on 13/11/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import Foundation
import BaseNetworkKit

enum RequesterAPI {
  // Body can be a model object conform to NKCodable
  case listOfItems
}

extension RequesterAPI: NKFlowTarget {
  // Set your api
  var baseURL: URL {
    return URL(stringValue: "https://api.spacexdata.com/v3/")
  }

  // Set your endpoints
  var path: String {
    switch self {
    case .listOfItems:
      return "launches/next"
    }
  }

  // Set http methods
  var method: NKHTTPMethods {
    return .get
  }

  // Here you can set the tasks, like parameters
  var task: NKTask {
    switch self {
    case .listOfItems:
      return .requestPlain
    }
  }

  // You want to see the request logs, set the environment to develop
  var environment: NKEnvironment {
    return .develop
  }
}

class Service: NKBaseService<RequesterAPI> {
  func fetchItems(completion: @escaping NKCommon.ResultType<Model>) {
    fetch(.listOfItems, dataType: Model.self, completion: completion)
  }
}
