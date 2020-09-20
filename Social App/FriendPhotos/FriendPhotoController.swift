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
    
    lazy var friendPhotoView = UIImageView()
    lazy var likeImage = UIImage(named: "pizza3")
    lazy var likeCount = UILabel()
    lazy var likeButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActions()
        likeCount.text = "\(0)"
        UIView.animate(withDuration: 0.5) {
            self.friendPhotoView.alpha = 0.5
        }
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
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhoto", for: indexPath)
            as? FriendPhotoCell else { return UICollectionViewCell() }
        
        cell.likeCount.text = likeCount.text
        cell.likeButton.addTarget(self, action: #selector(likeTap), for: .touchUpInside)
        cell.friendPhoto.image = friendPhotoView.image
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
