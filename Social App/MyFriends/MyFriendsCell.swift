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
    
    public var cellData: Items? {
        didSet {
            guard
                let firstname = cellData?.first_name,
                let lastname = cellData?.last_name,
                let image = URL(string: "\(cellData?.photo_200_orig ?? "")")
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
        friendImage.layer.cornerRadius = 20
        friendImage.layer.shadowOffset = CGSize(width: 5, height: 5)
        friendImage.layer.shadowOpacity = 1
    }
}
