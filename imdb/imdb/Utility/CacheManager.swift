//
//  CacheManager.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation

protocol LocalStorageKeysProtocol {
    var rawValue: String { get }
}

protocol LocalStorageProtocol {
    func value<T>(key: LocalStorageKeysProtocol) -> T?
    func write<T>(key: LocalStorageKeysProtocol, value: T?)
    func remove(key: LocalStorageKeysProtocol)
}

enum LocalStorageKeys: String, LocalStorageKeysProtocol {
    case login
    case user
}

class CacheManager: LocalStorageProtocol {

    static let shared = CacheManager()

    private init() { }

    fileprivate let userDefaults: UserDefaults = UserDefaults.standard

    func value<T>(key: LocalStorageKeysProtocol) -> T? {
        return self.userDefaults.object(forKey: key.rawValue) as? T
    }

    func write<T>(key: LocalStorageKeysProtocol, value: T?) {
        self.userDefaults.set(value, forKey: key.rawValue)
    }

    func remove(key: LocalStorageKeysProtocol) {
        self.userDefaults.set(nil, forKey: key.rawValue)
    }
}
