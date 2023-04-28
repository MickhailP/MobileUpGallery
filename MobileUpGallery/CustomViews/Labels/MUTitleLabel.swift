//
//  MUTitleLabel.swift
//  MyFollowers
//
//  Created by Миша Перевозчиков on 28.04.2023.
//

import UIKit

class MUTitleLabel: UILabel {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}


	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
		self.init(frame: .zero)
		self.textAlignment = textAlignment
		self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
	}


	private func configure() {
		textColor = .label
		adjustsFontSizeToFitWidth = true
		minimumScaleFactor = 0.9
		lineBreakMode = .byWordWrapping
		translatesAutoresizingMaskIntoConstraints = false
		numberOfLines = 0
	}
}
