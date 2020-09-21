//
//  URLList.swift
//  Social App
//
//  Created by Алексей Смицкий on 21.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import Foundation

// MARK: -URLList

enum URLList {
    
    static let api:
        String = "https://api.vk.com/method/"
    static let token:
        String = "4e5ec4864f6f43708051171deb47a5560fcb8fbdf96282989305da13735aecffc5a4175f0e68c5a198c2f"
    static let friendList:
        String = "\(api)friends.get?user_ids=leshaaleshaaa&fields=photo_200_orig&access_token=\(token)&v=5.124"
}
