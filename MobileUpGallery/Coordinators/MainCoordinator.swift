//
//  MainCoordinator.swift
//  MobileUpGallery
//
//  Created by Миша Перевозчиков on 27.04.2023.
//

import Foundation
import UIKit


protocol Coordinator: AnyObject {
	var navigationController: UINavigationController { get set }

	func start()
	func presentLoginView()
	func presentWebView()
	func presentGallery(for user: User)
}


protocol Coordinating {
	var coordinator: Coordinator? { get set }
}


final class MainCoordinator: Coordinator {

	var navigationController: UINavigationController


	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}


	func start() {
		
	}


	func presentLoginView() {

	}


	func presentWebView() {

	}


	func presentGallery(for user: User) {

	}
}