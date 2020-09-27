//
//  PhotoDeatilController.swift
//  Social App
//
//  Created by Алексей Смицкий on 22.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - PhotoDetailController

final class PhotoDetailController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var selectedPhoto: UIImageView!
    
    // MARK: - Public properties
    
    public lazy var imageURL = String()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPhoto.parseImage(url: URL(string: imageURL)!)
        view.backgroundColor = .black
    }
}
