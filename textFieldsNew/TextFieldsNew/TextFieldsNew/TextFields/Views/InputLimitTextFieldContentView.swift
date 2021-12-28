//
//  NoDigitsTextFieldContentView.swift
//  TextFields
//
//  Created by out-zamotaev-pk on 30.11.2021.
//

import UIKit
import SnapKit

class InputLimitTextFieldContentView: UIView {
	
	private let inputLimitLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Input limit"
		label.frame.size = label.intrinsicContentSize
		label.font = UIFont.systemFont(ofSize: Constants.labelFontSize)
		return label
	}()

	private let inputLimitCounterLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "0/\(Constants.inputLimit)"
		label.accessibilityIdentifier = "CounterLabel"
		label.frame.size = label.intrinsicContentSize
		label.font = UIFont.systemFont(ofSize: Constants.labelFontSize)
		return label
	}()

	private let textField: InputLimitTextField = {
		let textField = InputLimitTextField()
		textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
		return textField
	}()

	@objc func textFieldDidChange(_ textField: UITextField) {
		configureInputLimitTextFieldContentView()
	}

	init() {
		super.init(frame: .zero)
		setupInputLimitCounterLabel()
		setupInputLimitLabel()
		setupInputLimitTextField()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		fatalError("init(coder:) has not been implemented")
	}

	private func configureInputLimitTextFieldContentView() {
		let inputLimitRegex = ".{0,\(Constants.inputLimit)}"
		let text = textField.text ?? ""
		inputLimitCounterLabel.text = "\(text.count)/\(Constants.inputLimit)"
		if text.isValid(regex: inputLimitRegex) {
			textField.layer.borderColor = Constants.activeTextFieldBorderColor.cgColor
			inputLimitCounterLabel.textColor = .none
		} else {
			textField.layer.borderColor = Constants.notValidColor.cgColor
			inputLimitCounterLabel.textColor = Constants.notValidColor
		}
	}

	private func setupInputLimitCounterLabel() {
		addSubview(inputLimitCounterLabel)
	
		inputLimitCounterLabel.snp.makeConstraints {
			$0.top.equalToSuperview()
			$0.trailing.equalToSuperview()
		}
	}

	private func setupInputLimitLabel() {
		addSubview(inputLimitLabel)
	
		inputLimitLabel.snp.makeConstraints {
			$0.top.equalToSuperview()
			$0.leading.equalToSuperview()
		}
	}

	private func setupInputLimitTextField() {
		addSubview(textField)
		textField.delegate = self

		textField.snp.makeConstraints {
			$0.top.equalTo(inputLimitLabel.snp.bottom).offset(Constants.spacingBetweenTextFieldAndLabel)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalToSuperview()
		}
	}
}

extension InputLimitTextFieldContentView: UITextFieldDelegate {

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.layer.borderColor = Constants.activeTextFieldBorderColor.cgColor
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		textField.layer.borderColor = Constants.textFieldBorderColor.cgColor
	}
}
