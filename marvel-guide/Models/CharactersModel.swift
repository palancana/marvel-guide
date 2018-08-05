//
//  CharactersModel.swift
//  marvel-guide
//
//  Created by Rafael Díaz on 02/08/2018.
//  Copyright © 2018 Rafael Díaz. All rights reserved.
//

import Foundation

struct MarvelCharacters: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let data: DataClass
    let etag: String
}

struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

struct Result: Codable {
    let id: Int
    let name, description, modified, resourceURI: String
    let urls: [URL]
    let thumbnail: Thumbnail
    let comics: Comics
    let stories: Stories
    let events, series: Comics
}

struct Comics: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [ComicsItem]
}

struct ComicsItem: Codable {
    let resourceURI, name: String
}

struct Stories: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [StoriesItem]
}

struct StoriesItem: Codable {
    let resourceURI, name, type: String
}

struct Thumbnail: Codable {
    let path, thumbnailExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

struct URL: Codable {
    let type, url: String
}

