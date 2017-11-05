//
//  GeoCache.swift
//  
//
//  Created by Preethi Periyakoil on 10/29/17.
//

import Foundation

struct GeoCache {
    let title: String
    let details: String
    let creator: String
    let reward: String
    
    init?(fromDictionary dict: [String: String]) {
        guard let title = dict["title"] else {
            return nil
        }
        self.title = title
        
        guard let details = dict["details"] else {
            return nil
        }
        self.details = details
        
        guard let creator = dict["creator"] else {
            return nil
        }
        self.creator = creator
        
        guard let reward = dict["reward"] else {
            return nil
        }
        self.reward = reward
    }
    
    var dictionary: [String: String] {
        get {
            var dict = [String: String]()
            dict["title"] = self.title
            dict["details"] = self.creator
            dict["creator"] = self.creator
            dict["reward"] = self.reward
            return dict
        }
    }
    
    var description: String {
        get {
            return "Title: " + self.title + "\r"
            + "Details: " + self.details
            + "Creator: " + self.creator
            + "Reward: " + self.reward
        }
    }
    
}

func loadCachesFromDefaults() -> [GeoCache] {
    let defaults = UserDefaults.standard
    let geocache_arr = defaults.array(forKey: "GeoCacheArray") ?? [Any]()
    
    var geocaches = [GeoCache]()
    for gc in geocache_arr {
        geocaches.append(GeoCache(fromDictionary: gc as! [String: String])!)
    }
    return geocaches
}

func saveCachesToDefaults(_ caches: [GeoCache]) {
    let defaults = UserDefaults.standard
    defaults.set(caches, forKey: "GeoCacheArray")
    defaults.synchronize()
}
