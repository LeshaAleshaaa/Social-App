//
//  FriendPhotoCell.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 16.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - FriendPhotoCell

final class FriendPhotoCell: UICollectionViewCell {
    
    // MARK: - Public properties
    
    public var cellData: Photos? {
        didSet {
            guard
                let images = cellData?.url,
                let url = URL(string: images)
            else { return }
            friendPhoto?.parseImage(url: url)
            friendPhoto?.contentMode = .scaleAspectFill
            friendPhoto?.backgroundColor = .systemGray5
            backgroundColor = .systemGray4
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var friendPhoto: UIImageView?
}

