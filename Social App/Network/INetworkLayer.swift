//
//  INetworkLayer.swift
//  Social App
//
//  Created by Алексей Смицкий on 20.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

//MARK: - INetworkLayer

protocol INetworkLayer {
    func getFriendsList(api: String, complition: @escaping (Results) -> Void)
    func getFriendPhotos(api: String, complition: @escaping (PhotosResults) -> Void)
}
