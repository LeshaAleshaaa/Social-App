//
//  FriendPhotosModel.swift
//  Social App
//
//  Created by Алексей Смицкий on 21.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import Foundation

// MARK: - PhotosResults

struct PhotosResults: Decodable {
    var response: PhotosInfo?
}

// MARK: - PhotosInfo

struct PhotosInfo: Decodable {
    var items: [PhotosItems]?
}

// MARK: - PhotosItems

struct PhotosItems: Decodable {
    var sizes: [Photos]?
}

// MARK: - Photos

struct Photos: Decodable {
    var url: String?
}
