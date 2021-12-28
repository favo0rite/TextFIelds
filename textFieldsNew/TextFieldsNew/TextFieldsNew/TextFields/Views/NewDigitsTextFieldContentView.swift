//
//  NoDigitsTextFieldContentView.swift
//  TextFields
//
//  Created by out-zamotaev-pk on 30.11.2021.
//

import UIKit
import SnapKit

class NoDigitsTextFieldContentView: UIView {
	
	private let noDigitsFieldLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "NO digits field"
		label.frame.size = label.intrinsicContentSize
		label.font = UIFont.systemFont(ofSize: Constants.labelFontSize)
		label.isUserInteractionEnabled = false
		return label
	}()

	private let textField: NoDigitsTextField = {
		let textField = NoDigitsTextField()
		return textField
	}()

	init() {
		super.init(frame: .zero)
		setupNoDigitsLabel()
		setupNoDigitsTextField()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		fatalError("init(coder:) has not been implemented")
	}

	private func setupNoDigitsLabel() {
		addSubview(noDigitsFieldLabel)
	
		noDigitsFieldLabel.snp.makeConstraints {
			$0.top.equalToSuperview()
			$0.leading.trailing.equalToSuperview()
		}
	}

	private func setupNoDigitsTextField() {
		addSubview(textField)
		textField.delegate = self

		textField.snp.makeConstraints {
			$0.top.equalTo(noDigitsFieldLabel.snp.bottom).offset(Constants.spacingBetweenTextFieldAndLabel)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalToSuperview()
		}
	}
}

extension NoDigitsTextFieldContentView {
	func shouldChangeCharactersInNoDigitsTextField(replacementString string: String) -> Bool {
		return Int(string) == nil
	}
}

extension NoDigitsTextFieldContentView: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		return shouldChangeCharactersInNoDigitsTextField(replacementString: string)
	}

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
