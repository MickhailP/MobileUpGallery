//
//  WebViewVC.swift
//  MobileUpGallery
//
//  Created by Миша Перевозчиков on 28.04.2023.
//

import UIKit
import WebKit
import SnapKit

class WebViewVC: UIViewController, WKUIDelegate, WKNavigationDelegate {

	var webView: WKWebView!
	let viewModel: WebViewViewModel


	init(authService: AuthService, coordinator: Coordinator) {
		self.viewModel = WebViewViewModel(authService: authService, coordinator: coordinator)
		super.init(nibName: nil, bundle: nil)
	}


	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	override func viewDidLoad() {
		super.viewDidLoad()
		configureWebView()
		setupUI(of: webView)
		configureNavController()

		viewModel.preformWebViewRequest(for: webView)
	}


	private func configureWebView() {
		let webConfiguration = WKWebViewConfiguration()
		webView = WKWebView(frame: .zero, configuration: webConfiguration)
		webView.uiDelegate = self
		webView.navigationDelegate = self
	}


	private func setupUI(of webView: WKWebView) {
		self.view.backgroundColor = .systemBackground
		webView.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(webView)


		webView.snp.makeConstraints { make in
			make.top.equalTo(view.snp.top).offset(0)
			make.bottom.equalTo(view.snp.bottom).inset(0)
			make.leading.equalTo(view.snp.leading).inset(0)
			make.trailing.equalTo(view.snp.trailing).offset(0)
		}

	}


	private func configureNavController() {
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissView))
		doneButton.tintColor = .systemBlue
		self.navigationItem.rightBarButtonItem = doneButton
	}


	@objc func dismissView() {
		dismiss(animated: true)
		do {
			try viewModel.showGalleryView()
			// SHOW Success message
		} catch  {
			//SHOW ALERT
			print("ERROR")
		}
	}
}


// MARK: WKNavigationDelegate methods
extension WebViewVC {
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

		guard let redirectURL = webView.url else { return }
		print(redirectURL)

		do {
			try viewModel.authService.checkIsAuthorisationFinished(for: redirectURL)
			DispatchQueue.main.async {
				webView.stopLoading()
			}
		} catch  {
			// Show alert
		}
	}
}
