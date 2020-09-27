//
//  URLList.swift
//  Social App
//
//  Created by Алексей Смицкий on 21.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import Foundation

// MARK: - URLList

enum URLList {
    
    static let api:
        String = "https://api.vk.com/method/"
    static let photosApi:
        String = "https://api.vk.com/method/photos.getAll?owner_id="
    static let version:
        String = "&v=5.124"
    static let accessText:
        String = "&access_token="
    static var token:
        String = ""
    static let friendList:
        String = "\(api)friends.get?fields=photo_200_orig\(accessText)\(token)\(version)"
    static let groupsApi:
        String = "\(api)groups.get?extended=1\(accessText)\(token)\(version)"
}
