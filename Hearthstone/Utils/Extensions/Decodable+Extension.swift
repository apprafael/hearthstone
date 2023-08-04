//
//  JSONSerialization+Extension.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 02/08/23.
//
import Foundation

extension Decodable {
    static func fromJSON<T: Decodable>(fileName: String, fileExtension: String = "json") -> T? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("Failed to locate \(fileName).\(fileExtension) in bundle.")
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load \(fileName).\(fileExtension) from bundle.")
            return nil
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            print("Failed to decode \(fileName).\(fileExtension) from bundle.")
            return nil
        }
        
        return loaded
    }
}

