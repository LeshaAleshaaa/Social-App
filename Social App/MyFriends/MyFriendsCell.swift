//
//  MyFriendsCell.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 16.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - MyFriendCell

final class MyFriendsCell: UITableViewCell {
    
    // MARK: - Public properties
    
    public var cellData: Items? {
        didSet {
            guard
                let firstname = cellData?.first_name,
                let lastname = cellData?.last_name,
                let image = URL(string: "\(cellData?.photo_200_orig ?? Constants.emptyImage)")
            else { return }
            friendName.text = "\(firstname) \(lastname)"
            friendImage.parseImage(url: image)
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Setups

private extension MyFriendsCell {
    
    func setupViews() {
        setFriendImage()
    }
    
    func setFriendImage() {
        friendImage.layer.cornerRadius = Constants.imageCorner
        friendImage.layer.shadowOffset = Constants.imageOffset
        friendImage.layer.shadowOpacity = Constants.imageOpacity
    }
}

// MARK: - Constants

private extension MyFriendsCell {
    
    enum Constants {
        
        static let emptyImage: String = ""
        static let imageCorner: CGFloat = 20
        static let imageOffset: CGSize = CGSize(width: 5, height: 5)
        static let imageOpacity: Float = 1
    }
}
