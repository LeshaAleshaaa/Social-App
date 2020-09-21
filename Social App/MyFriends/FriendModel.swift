//
//  FriendModel.swift
//  Social App
//
//  Created by Алексей Смицкий on 20.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import Foundation

// MARK: - Results

struct Results: Decodable {
    var response: Info?
}

// MARK: - Info

struct Info: Decodable {
    var items: [Items]?
}

// MARK: - Items

struct Items: Decodable {
    var id: Int?
    var first_name: String?
    var last_name: String?
    var photo_200_orig: String?
}
