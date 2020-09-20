//
//  FriendModel.swift
//  Social App
//
//  Created by Алексей Смицкий on 20.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import Foundation

struct Results: Decodable {
    var response: Info?
}

struct Info: Decodable {
    var items: [Items]?
}

struct Items: Decodable {
    var first_name: String?
    var last_name: String?
}
