//
//  Photo.swift
//  ListOfPhotoMetadate
//
//  Created by Sergey Lukaschuk on 2023-02-17.
//

import Foundation

struct Photo: Decodable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: URL
    let downloadUrl: URL

    enum CodingKeys: String, CodingKey {
        case id
        case author
        case width
        case height
        case url
        case downloadUrl = "download_url"
    }
}

let json = """
[
    {
        "id": "0",
        "author": "Alejandro Escamilla",
        "width": 5616,
        "height": 3744,
        "url": "https://unsplash.com/photos/yC-Yzbqy7PY",
        "download_url": "https://picsum.photos/id/0/5616/3744"
    }
]
"""

let data = json.data(using: .utf8)!
let photos = try! JSONDecoder().decode([Photo].self, from: data)

