//
//  CaretakerGameSession.swift
//  Millionaire
//
//  Created by Pavel Olegovich on 29.01.2022.
//

import Foundation

class CaretakerGameSession {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "CaretakerGameSessionKey"
    
    func save(results: [GameSession]) {
        do {
            let data = try encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [GameSession]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([GameSession].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
