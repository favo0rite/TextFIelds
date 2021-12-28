//
//  ViewController.swift
//  TextFieldsNew
//
//  Created by out-zamotaev-pk on 30.11.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

	// MARK: UIElements
	private let textFieldsTitle: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Text Fields"
		label.frame.size = label.intrinsicContentSize
		label.font = UIFont.boldSystemFont(ofSize: Constants.textFieldsTitleFontSize)
		label.textAlignment = .center
		return label
	}()

	private let noDigitsTextFieldContentView = NoDigitsTextFieldContentView()
	private let inputLimitTextFieldContentView = InputLimitTextFieldContentView()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTextFieldsTitle()
		setupNoDigitsTextFieldContentView()
		setupInputLimitTextFieldContentView()
	}

	// MARK: Loading UI
	private func setupTextFieldsTitle() {
		view.addSubview(textFieldsTitle)
		textFieldsTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 92).isActive = true
		textFieldsTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.spacingOnSides).isActive = true
		textFieldsTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.spacingOnSides).isActive = true
	}

	private func setupNoDigitsTextFieldContentView() {
		view.addSubview(noDigitsTextFieldContentView)
		
		noDigitsTextFieldContentView.snp.makeConstraints {
			$0.top.equalTo(textFieldsTitle.snp.bottom).offset(Constants.spacingBetweenTextFieldInterfaces)
			$0.leading.equalToSuperview().offset(Constants.spacingOnSides)
			$0.trailing.equalToSuperview().offset(-Constants.spacingOnSides)
		}
	}

	private func setupInputLimitTextFieldContentView() {
		view.addSubview(inputLimitTextFieldContentView)
		
		inputLimitTextFieldContentView.snp.makeConstraints {
			$0.top.equalTo(noDigitsTextFieldContentView.snp.bottom).offset(Constants.spacingBetweenTextFieldInterfaces)
			$0.leading.equalToSuperview().offset(Constants.spacingOnSides)
			$0.trailing.equalToSuperview().offset(-Constants.spacingOnSides)
		}
	}

}

