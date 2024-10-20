//
//  CustomView.swift
//  HW26
//
//  Created by Ярослав Кочкин on 17.10.2024.
//

import UIKit

protocol ICustomViewDelegate {
	func pressed(nameView: String)
}



class CustomView: UIView {
		
	var delegate: ICustomViewDelegate?
	
	var nameInstance: String?
		
	init(color: UIColor) {
		super.init(frame: .zero)
		setupView(color: color)
	}
	
	@available (*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
		super.hitTest(point, with: event)
		
		guard isUserInteractionEnabled, !isHidden, alpha > 0 else {
			return nil
		}
		
		if self.point(inside: point, with: event) {
			for subview in subviews.reversed() {
				let convertedPoint = subview.convert(point, from: self)
				if let hitView = subview.hitTest(convertedPoint, with: event) {
					return hitView
				}
			}
			delegate?.pressed(nameView: self.nameInstance ?? "nil")
			return self
		}
		return nil
	}
	
	override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
		if super.point(inside: point, with: event) {
			return true
		}
		for subview in subviews.reversed() {
			let convertedPoint = subview.convert(point, from: self)
			if self.point(inside: convertedPoint, with: event) {
				return true
			}
		}
		return false
	}
}

private extension CustomView {
	func setupView(color: UIColor) {
		backgroundColor = color
	}
}
