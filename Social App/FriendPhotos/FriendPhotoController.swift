//
//  FriendPhotoController.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 16.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - FriendPhotoController

final class FriendPhotoController: UICollectionViewController {
    
    // MARK: - Public properties
    
    public var basicViewURL: String?
    public var friendID: Int?
    
    // MARK: - Private properties
    
    private lazy var likeImage = UIImage(named: "pizza3")
    private lazy var likeCount = UILabel()
    private lazy var likeButton = UIButton()
    private lazy var results = PhotosResults()
    private lazy var friendPhotoView = UIImageView()
    private var parsingResults: INetworkLayer?

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActions()
        likeCount.text = "\(0)"
        loadData(whichApi: "https://api.vk.com/method/photos.getAll?owner_id=\(friendID!)&access_token=4e5ec4864f6f43708051171deb47a5560fcb8fbdf96282989305da13735aecffc5a4175f0e68c5a198c2f&v&v=5.124")
    }
    
    // MARK: - Private methods
    
    
    private func loadData(whichApi: String) {
        parsingResults = NetworkLayer()
        parsingResults?.getFriendPhotos(api: whichApi, complition: { [weak self] item in
            guard let self = self else { return }
            
            self.results = item
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }

    @objc
    private func likeTap() {
        if likeCount.text == "\(0)" {
        likeImage = UIImage(named: "pizza2")
        likeCount.text = "\(1)"
        collectionView.reloadData()
        } else {
            likeImage = UIImage(named: "pizza3")
            likeCount.text = "\(0)"
            collectionView.reloadData()
        }
}
    
}
// MARK: - Setups

extension FriendPhotoController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.response?.items?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhoto", for: indexPath)
            as? FriendPhotoCell else { return UICollectionViewCell() }
        
        cell.likeCount.text = likeCount.text
        cell.likeButton.addTarget(self, action: #selector(likeTap), for: .touchUpInside)
        cell.cellData = results.response?.items?[indexPath.row].sizes?[3]
        cell.likeImage.image = likeImage
        return cell
    }
}

// MARK: - Setup Elements

private extension FriendPhotoController {
    
    func addActions() {
//        likeButton.addTarget(self, action: #selector(likeTap), for: .touchUpInside)
    }
}
