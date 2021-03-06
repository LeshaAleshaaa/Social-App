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
    
    @IBOutlet private weak var webView: WKWebView? {
        didSet {
            webView?.navigationDelegate = self
        }
    }
    
    @IBSegueAction func tabBarSetup(_ coder: NSCoder) -> UITabBarController? {
        navigationController?.navigationBar.isHidden = true
        return UITabBarController(coder: coder)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setups

extension LoginController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String:String] ()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        let token = params["access_token"]
        
        URLList.token = token ?? ""
                
        decisionHandler(.cancel)
    }
}

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
