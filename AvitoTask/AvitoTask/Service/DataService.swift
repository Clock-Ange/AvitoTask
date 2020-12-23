//
//  DataService.swift
//  AvitoTask
//
//  Created by Геннадий Махмудов on 22.12.2020.
//

import Foundation

class DataService {
    public final func parseResult() -> Result {
        let url = Bundle.main.url(forResource: "result", withExtension: "json")!
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let results = try decoder.decode(Adverts.self, from: data)
            return results.result
        }catch let parseError {
            fatalError("Loading error occurred: \(parseError.localizedDescription)")
        }
    }

}
