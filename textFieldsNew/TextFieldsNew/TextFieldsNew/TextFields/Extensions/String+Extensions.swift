//
//  String+Extensions.swift
//  TextFieldsNew
//
//  Created by out-zamotaev-pk on 30.11.2021.
//

import Foundation

extension String {

	func isValid(regex: String) -> Bool {
		let format = "SELF MATCHES %@"
		return NSPredicate(format: format, regex).evaluate(with: self)
	}

	func deleteAllNumbers() -> String {
		return self.components(separatedBy: CharacterSet.decimalDigits).joined()
	}
}
