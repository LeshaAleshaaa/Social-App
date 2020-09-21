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
    
    @IBOutlet private weak var webView: WKWebView?

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
            webView?.load(URLRequest(url: vkURL))
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7602954"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        let request = URLRequest(url: urlComponents.url!)
            webView?.load(request)
    }
}
}
