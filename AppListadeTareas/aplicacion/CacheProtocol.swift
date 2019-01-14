//
//  CacheProtocol.swift
//  aplicacion
//
//  Created by user150462 on 1/11/19.
//  Copyright © 2019 user150462. All rights reserved.
//

import Foundation
protocol CacheProtocol{
    func loadObjectForKey(key: String) -> AnyObject?
    func saveObject(object: AnyObject, key: String)
}
