//
//  LoginController.swift
//  Social App
//
//  Created by Алексей Смицкий on 20.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit
import WebKit

// MARK: - LoginController

final class LoginController: UIViewController {

    
    
    // MARK: - Outlets
    
    @IBOutlet weak var webView: WKWebView!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Serups

private extension LoginController {
    
    func setupViews() {
        setWebView()
    }
    
    func setWebView() {
        if let vkURL = URL(string: "https://www.vk.com") {
        webView.load(URLRequest(url: vkURL))
    }
    }
}
