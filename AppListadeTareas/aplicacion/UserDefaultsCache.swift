//
//  UserDefaultsCache.swift
//  aplicacion
//
//  Created by user150462 on 1/11/19.
//  Copyright © 2019 user150462. All rights reserved.
//

import Foundation

class UserDefaultsCache: CacheProtocol {
    
func loadObjectForKey(key: String) -> AnyObject? {
    return UserDefaults.standard.object(forKey: key) as AnyObject?
    }
func saveObject(object: AnyObject, key: String){
    
        UserDefaults.standard.set(object, forKey: key)

}
}

