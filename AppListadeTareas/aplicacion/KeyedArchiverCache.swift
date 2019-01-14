//
//  KeyedArchiverCache.swift
//  aplicacion
//
//  Created by user150462 on 1/11/19.
//  Copyright © 2019 user150462. All rights reserved.
//

import Foundation
class  KeyedArchiverCache: CacheProtocol {
    static let ArchiveExtension = "archive"
    
    
    func loadObjectForKey(key: String) -> AnyObject? {
        
        let path = self.archivePath(key)
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: path) as AnyObject?
    }
    
    func saveObject(object: AnyObject, key: String) {
        
        let path = self.archivePath(key)
        
        NSKeyedArchiver.archiveRootObject(object, toFile: path)
       
        
    }
    
    // MARK: Utilities
    
    func archivePath(_ key: String) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        var URL = Foundation.URL(string: path)!
        
        URL = URL.appendingPathComponent(key)
        URL = URL.appendingPathExtension("archive")
        
        return URL.absoluteString as String
    }
}
