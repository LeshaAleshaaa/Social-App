//
//  FriendPhotoCell.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 16.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

class FriendPhotoCell: UICollectionViewCell {

    public var cellData: Photos? {
        didSet {
            guard
                let images = cellData?.url
            else { return }
            friendPhoto.parseImage(url: URL(string: images)!)
        }
    }
    
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
}
