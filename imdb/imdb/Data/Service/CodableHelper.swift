//
//  CodableHelper.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation

class CodableHelper {

    static func decode<T: Decodable>(_ type: T.Type, data: Data) -> (decodedObj: T?, error: Error?) {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .base64

        do {
            return (try decoder.decode(type, from: data), nil)
        } catch {
            return (nil, error)
        }
    }
}
