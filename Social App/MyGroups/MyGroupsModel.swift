//
//  MyGroupsResults.swift
//  Social App
//
//  Created by Алексей Смицкий on 27.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

// MARK: - MyGroupsResults

struct MyGroupsResults: Decodable {
    
    var response: GroupInfo?
}

// MARK: - GroupInfo

struct GroupInfo: Decodable {
    
    var items: [GroupDetail]?
}

// MARK: - GroupDetail

struct GroupDetail: Decodable {
    
    var name: String?
    var photo_200: String?
}
