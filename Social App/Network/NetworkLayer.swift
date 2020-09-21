//
//  NewtworkLayer.swift
//  Social App
//
//  Created by Алексей Смицкий on 20.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import Foundation

//MARK: - NetworkLayer

final class NetworkLayer: INetworkLayer {
    
    func getFriendsList(api: String, complition: @escaping (Results) -> Void) {
        let urlString = api
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { ( data, _, error ) in
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(Results.self, from: data)
                complition(results)
            } catch {
                print("Json Error")
            }
        } .resume()
    }
    
    func getFriendPhotos(api: String, complition: @escaping (PhotosResults) -> Void) {
        let urlString = api
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { ( data, _, error ) in
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(PhotosResults.self, from: data)
                complition(results)
            } catch {
                print("Json Error")
            }
        } .resume()
    }
}
