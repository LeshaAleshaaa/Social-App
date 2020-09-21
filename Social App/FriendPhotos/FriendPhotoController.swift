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
    
    private lazy var likeImage = UIImageView()
    private lazy var likeCount = UILabel()
    private lazy var likeButton = UIButton()
    private lazy var results = PhotosResults()
    private lazy var friendPhotoView = UIImageView()
    private var parsingResults: INetworkLayer?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadData()
    }
    
    // MARK: - Private methods
    
    private func loadData() {
        parsingResults = NetworkLayer()
        parsingResults?.getFriendPhotos(
            api: URLList.photosApi + String(friendID ?? Constants.emptyID) + URLList.token + URLList.version,
            complition: { [weak self] item in
                guard let self = self else { return }
                
                self.results = item
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
    }
    
    // MARK: - Selectors
    
    @objc
    private func likeTap() {
        if likeCount.text == Constants.likeCount0 {
            likeImage.image = Constants.likedImage
            likeCount.text = Constants.likeCount1
            collectionView.reloadData()
        } else {
            likeImage.image = Constants.likeImageImage
            likeCount.text = Constants.likeCount0
            collectionView.reloadData()
        }
    }
}

// MARK: - Setups

extension FriendPhotoController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.response?.items?.count ?? Constants.emptyItems
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellName, for: indexPath)
                as? FriendPhotoCell else { return UICollectionViewCell() }
        
        cell.likeCount?.text = likeCount.text
        cell.likeButton?.addTarget(self, action: #selector(likeTap), for: .touchUpInside)
        cell.cellData = results.response?.items?[indexPath.row].sizes?[Constants.sizeCount]
        cell.likeImage?.image = likeImage.image
        return cell
    }
}

private extension FriendPhotoController {
    
    func setupViews() {
        setLikeImage()
        setLikeCount()
    }
    
    func setLikeImage() {
        likeImage.image = Constants.likeImageImage
    }
    
    func setLikeCount() {
        likeCount.text = Constants.likeCount0
    }
    
    func setURL() {
    }
}

// MARK: - Constants

private extension FriendPhotoController {
    
    enum Constants {
        
        static let likeImageImage = UIImage(named: "pizza2")
        static let likedImage = UIImage(named: "pizza3")
        
        static let likeCount0: String = "0"
        static let likeCount1: String = "1"
        
        static let emptyItems: Int = 0
        static let cellName: String = "friendPhoto"
        static let sizeCount: Int = 3
        static let emptyID: Int = 0
        
    }
}
