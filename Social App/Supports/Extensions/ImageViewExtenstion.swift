//
//  ImageViewExtenstion.swift
//  Social App
//
//  Created by Алексей Смицкий on 20.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - ImageView Extension

extension UIImageView {
    func parseImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
