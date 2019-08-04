//
//  Portfolio.swift
//  App
//
//  Created by Arsha Hassas on 8/3/19.
//

import Foundation
import Vapor

struct Portfolio: Codable {
    
    let fullName: String
    let job: String
    let hometown: String
    let email: String
    let number: String
    let skills: [Skill]
    let languages: [Language]
    let educations: [Education]
    
    static func load() throws -> Portfolio {
        let directoryConfig = DirectoryConfig.detect()
        let filePath = directoryConfig.workDir.appending("Sources/App/Models/Portfolio.json")
        let fileURL = URL(fileURLWithPath: filePath)

        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let object = try decoder.decode(Portfolio.self, from: data)
        return object
        
    }
}

extension Portfolio: Content {}

