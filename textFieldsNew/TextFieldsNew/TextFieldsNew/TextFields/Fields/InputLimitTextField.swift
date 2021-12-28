//
//  File.swift
//  TextFieldsNew
//
//  Created by out-zamotaev-pk on 30.11.2021.
//

import UIKit

class InputLimitTextField: UITextField {
	
	init() {
		super.init(frame: .zero)
		defaultConfigurations()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		fatalError("init(coder:) has not been implemented")
	}
		
	private func defaultConfigurations() {
		font = UIFont.systemFont(ofSize: Constants.textFieldfontSize)
		borderStyle = UITextField.BorderStyle.roundedRect
		autocorrectionType = UITextAutocorrectionType.no
		keyboardType = UIKeyboardType.default
		returnKeyType = UIReturnKeyType.done
		contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		translatesAutoresizingMaskIntoConstraints = false
		layer.cornerRadius = Constants.textFieldCornerRadius
		layer.borderWidth = Constants.textFieldBorderWidth
		layer.borderColor = Constants.textFieldBorderColor.cgColor
		accessibilityIdentifier = "InputLimitTextField"
		layer.masksToBounds = true
		backgroundColor = Constants.textFieldBackgroundColor
		attributedPlaceholder = NSAttributedString(string: "Type here", attributes: [NSAttributedString.Key.foregroundColor: Constants.textFieldPlaceHolderBackgroundColor])
		frame.size.height = Constants.textFieldHeight
	}
}
