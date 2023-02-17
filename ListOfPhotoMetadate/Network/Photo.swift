//
//  Photo.swift
//  ListOfPhotoMetadate
//
//  Created by Sergey Lukaschuk on 2023-02-17.
//

import Foundation

struct Photo: Codable, Identifiable {
    var id: String
    var author: String
    var widht: CGFloat
    var height: CGFloat
    var url: URL
    var download_url: URL
}

// MARK: Example JSON
/*
 “{
 "id": "0",
 "author": "Alejandro Escamilla",
 "width": 5616,
 "height": 3744,
 "url": "https://unsplash.com/photos/yC-Yzbqy7PY",
 "download_url": "https://picsum.photos/id/0/5616/3744"
 }
 */
