//
//  WikipediaWebViewController.swift
//  Cats
//
//  Created by Andres Carrillo on 27/10/20.
//

import UIKit
import WebKit

class WikipediaWebViewController: UIViewController, WKNavigationDelegate {
    
    private var webView: WKWebView!
    private let webViewURL: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        loadRequest()
    }
    
    init(webViewURL: String) {
        self.webViewURL = webViewURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadRequest() {
        guard let url = URL(string: webViewURL) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}
