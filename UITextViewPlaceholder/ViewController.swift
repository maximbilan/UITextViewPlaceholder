//
//  ViewController.swift
//  UITextViewPlaceholder
//
//  Created by Maxim on 7/24/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let placeholder = "Placeholder"
	
	@IBOutlet weak var textView: UITextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		textView.delegate = self
		textView.text = placeholder
		textView.textColor = UIColor.lightGray
		textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
	}

}

extension ViewController: UITextViewDelegate {
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		
		let currentText: NSString = textView.text as NSString
		let updatedText = currentText.replacingCharacters(in: range, with:text)
		
		if updatedText.isEmpty {
			textView.text = placeholder
			textView.textColor = UIColor.lightGray
			textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
			return false
		}
		else if textView.textColor == UIColor.lightGray && !text.isEmpty {
			textView.text = nil
			textView.textColor = UIColor.black
		}
		
		return true
	}
	
	func textViewDidChangeSelection(_ textView: UITextView) {
		if self.view.window != nil {
			if textView.textColor == UIColor.lightGray {
				textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
			}
		}
	}
	
}
