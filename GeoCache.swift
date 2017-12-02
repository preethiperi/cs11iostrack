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
    let id: Int
    
    init?(fromDictionary dict: [String: Any]) {
        guard let title = dict["title"] else {
            return nil
        }
        self.title = title as! String
        
        guard let details = dict["details"] else {
            return nil
        }
        self.details = details as! String
        
        guard let creator = dict["creator"] else {
            return nil
        }
        self.creator = creator as! String
        
        guard let reward = dict["reward"] else {
            return nil
        }
        self.reward = reward as! String
        
        guard let id = dict["id"] else {
            return nil
        }
        self.id = id as! Int
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
            + "Details: " + self.details + "\r"
            + "Creator: " + self.creator + "\r"
            + "Reward: " + self.reward + "\r"
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
    var dict_array = [[String: String]]()
    for gc in caches {
        dict_array.append(gc.dictionary)
    }
    defaults.set(dict_array, forKey: "GeoCacheArray")
    defaults.synchronize()
}

func randomCacheId() -> Int {
    return Int(arc4random())
}

func sendCacheToServer(_ cache: GeoCache) {
    var request = URLRequest(url: URL(string: "http://localhost:5000/createCache")!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    let data = try? JSONSerialization.data(withJSONObject: cache.dictionary)
    request.httpBody = data
}

func loadCachesFromServer(onComplete: @escaping ([GeoCache]) -> ()) {
    var gcArray = [GeoCache]()
    
    var request = URLRequest(url: URL(string: "http://localhost:5000/getCaches")!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request, completionHandler: {
        data, response, error in
        if let error = error {
            print(error.localizedDescription)
            return
        } else {
            do {
                let cacheArray : [[String: AnyObject]] = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]] as [[String : AnyObject]]
                for dict in cacheArray {
                    gcArray.append(GeoCache(fromDictionary: dict)!)
                }
            } catch let error as NSError {
                print(error)
            }
        }
    })
    task.resume()
    onComplete(gcArray)
}
