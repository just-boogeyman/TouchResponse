//
//  ViewController.swift
//  HW26
//
//  Created by brubru on 15.10.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let viewA = CustomView(color: .lightGray)
	private let viewB = CustomView(color: .red)
	private let viewC = CustomView(color: .blue)
	private let viewD = CustomView(color: .yellow)
	private let viewE = CustomView(color: .green)
	
	private let nameViewLable = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addSubViews()
		setupViews()
		addLabels()
		setupLayout()
		
	}
}

private extension ViewController {
	func addSubViews() {
		[viewA, viewB, viewC, viewD, viewE].forEach{
			$0.delegate = self
		}
		view.addSubview(viewA)
		view.addSubview(nameViewLable)
		
		viewA.addSubview(viewB)
		viewA.addSubview(viewC)
		viewB.addSubview(viewD)
		viewC.addSubview(viewE)
	}
	
	func setupViews() {
		view.backgroundColor = .white
		nameViewLable.text = "Здась будет название выбранной вью"
		
		viewA.nameInstance = "viewA"
		viewB.nameInstance = "viewB"
		viewC.nameInstance = "viewC"
		viewD.nameInstance = "viewD"
		viewE.nameInstance = "viewE"
	}
	
	func addLabels() {
		addLabel(to: viewA, text: "A")
		addLabel(to: viewB, text: "B")
		addLabel(to: viewC, text: "C")
		addLabel(to: viewD, text: "D")
		addLabel(to: viewE, text: "E")
	}
}

// MARK: -> Private Methods
private extension ViewController {
	func addLabel(to view: UIView, text: String) {
		let label = UILabel()
		label.text = text
		label.font = UIFont.boldSystemFont(ofSize: 24)
		label.textColor = .black
		label.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(label)
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
			label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
		])
	}
	
}

private extension ViewController {
	func setupLayout() {
		viewA.translatesAutoresizingMaskIntoConstraints = false
		viewB.translatesAutoresizingMaskIntoConstraints = false
		viewC.translatesAutoresizingMaskIntoConstraints = false
		viewD.translatesAutoresizingMaskIntoConstraints = false
		viewE.translatesAutoresizingMaskIntoConstraints = false
		nameViewLable.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			viewA.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
			viewA.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
			viewA.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
			viewA.heightAnchor.constraint(equalToConstant: 300),
			
			viewB.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewB.leadingAnchor.constraint(equalTo: viewA.leadingAnchor, constant: 20),
			viewB.widthAnchor.constraint(equalToConstant: 150),
			viewB.heightAnchor.constraint(equalToConstant: 150),
			
			viewC.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewC.trailingAnchor.constraint(equalTo: viewA.trailingAnchor, constant: -20),
			viewC.widthAnchor.constraint(equalToConstant: 150),
			viewC.heightAnchor.constraint(equalToConstant: 150),
			
			viewD.bottomAnchor.constraint(equalTo: viewB.bottomAnchor, constant: -20),
			viewD.leadingAnchor.constraint(equalTo: viewB.leadingAnchor, constant: 20),
			viewD.widthAnchor.constraint(equalToConstant: 100),
			viewD.heightAnchor.constraint(equalToConstant: 50),
			
			viewE.topAnchor.constraint(equalTo: viewC.topAnchor, constant: 60),
			viewE.centerXAnchor.constraint(equalTo: viewC.centerXAnchor),
			viewE.widthAnchor.constraint(equalToConstant: 80),
			viewE.heightAnchor.constraint(equalToConstant: 120),
			
			nameViewLable.topAnchor.constraint(equalTo: viewA.bottomAnchor, constant: 100),
			nameViewLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			nameViewLable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
			nameViewLable.heightAnchor.constraint(equalToConstant: 75)
		])
	}
}

extension ViewController: ICustomViewDelegate {
	func pressed(nameView: String) {
		nameViewLable.text = nameView
	}
}
