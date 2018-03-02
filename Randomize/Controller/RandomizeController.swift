//
//  RandomizeController.swift
//  Randomize
//
//  Created by Rodrigo Sagebin on 3/2/18.
//  Copyright © 2018 Rodrigo Sagebin. All rights reserved.
//

import Foundation

class RandomizeController {
    static let shared = RandomizeController()
    init() {
        loadFromPS()
    }
    
    func addEntryWith(name: String) {
        let entry = Entry(name: name)
        entries.append(entry)
        saveToPS()
    }
    
    func remove(entry: Entry) {
        if let entryIndex = entries.index(of: entry) {
            entries.remove(at: entryIndex)
        }
        saveToPS()
    }
    
    func update(entry: Entry, with name: String) {
        entry.name = name
        saveToPS()
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "randomize.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    private func loadFromPS() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try decoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch let error {
            print("I no can haz save to persistent storage: \(error)")
        }
    }
    
    private func saveToPS() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print("I haz error saving to persistent storage: \(error)")
        }
    }
    
    private(set) var entries = [Entry]()
}
