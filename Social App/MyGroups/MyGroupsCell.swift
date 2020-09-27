//
//  MyGroupsCell.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 17.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - MyGroupsCell

final class MyGroupsCell: UITableViewCell {
    
    // MARK: - Public properties
    
    public var cellData: GroupDetail? {
        didSet {
            guard
                let groupImage = URL(string: cellData?.photo_200 ?? ""),
                let groupName = cellData?.name
            else { return }
            myGroupName?.text = groupName
            myGroupImage?.parseImage(url: groupImage)
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var myGroupName: UILabel?
    @IBOutlet weak var myGroupImage: UIImageView?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

// MARK: - Setups

private extension MyGroupsCell {
    
    func setupViews() {
        setGroupImage()
        setGroupName()
    }
    
    func setGroupImage() {
        myGroupImage?.contentMode = .scaleAspectFit
        myGroupImage?.layer.cornerRadius = 20
    }
    
    func setGroupName() {
        myGroupName?.textAlignment = .left
    }
}
