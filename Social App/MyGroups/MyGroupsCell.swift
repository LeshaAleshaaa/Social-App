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
    
    // MARK: - Outlets
    
    @IBOutlet weak var myGroupName: UILabel?
    @IBOutlet weak var myGroupImage: UIImageView?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
