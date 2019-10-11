//
//  UserDefaultsHelper.swift
//  SMM
//
//  Created by Vortex on 1/4/18.
//  Copyright © 2018 Vortex. All rights reserved.
//

import Foundation
class UserDefaultsHelper {
    
    func saveObject<T>(_ object : T, forKey key : String) {
        UserDefaults.standard.set(object, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func getObject<T>(forKey key : String) -> T? {
        guard let object = UserDefaults.standard.object(forKey: key) as? T else { return nil }
        return object
    }
    
    func deleteObject(forKey key : String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func objectExists(_ forKey : String) -> Bool {
        return UserDefaults.standard.object(forKey: forKey) != nil
    }
    
    
    func switchLanguage() {
        if getLanguage() == "ar" {
            setLanguage("en")
        } else {
            setLanguage("ar")
        }
    }
    
    func setLanguage(_ languageCode : String) {
        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    
    func getLanguage() -> String {
        let lang = UserDefaults.standard.array(forKey: "AppleLanguages")!
        let firstLanguage = lang[0] as! String
        if firstLanguage.lowercased().range(of: "ar") != nil {
            return "ar"
        } else {
            return "en"
        }
    }
    
    func clearUserDefaults() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
}
