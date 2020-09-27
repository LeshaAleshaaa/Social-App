//
//  NewGroupsCell.swift
//  Storyboard Practice
//
//  Created by Алексей Смицкий on 17.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - NewGroupsCell

final class NewGroupsCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var groupName: UILabel?
    @IBOutlet weak var groupImage: UIImageView?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
