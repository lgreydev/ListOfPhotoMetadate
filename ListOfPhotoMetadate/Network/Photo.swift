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

