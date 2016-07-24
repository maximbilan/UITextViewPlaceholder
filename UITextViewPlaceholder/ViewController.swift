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
		textView.textColor = UIColor.lightGrayColor()
		textView.selectedTextRange = textView.textRangeFromPosition(textView.beginningOfDocument, toPosition: textView.beginningOfDocument)
	}

}

extension ViewController: UITextViewDelegate {
	
	func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
		
		let currentText: NSString = textView.text
		let updatedText = currentText.stringByReplacingCharactersInRange(range, withString:text)
		
		if updatedText.isEmpty {
			textView.text = placeholder
			textView.textColor = UIColor.lightGrayColor()
			textView.selectedTextRange = textView.textRangeFromPosition(textView.beginningOfDocument, toPosition: textView.beginningOfDocument)
			return false
		}
		else if textView.textColor == UIColor.lightGrayColor() && !text.isEmpty {
			textView.text = nil
			textView.textColor = UIColor.blackColor()
		}
		
		return true
	}
	
	func textViewDidChangeSelection(textView: UITextView) {
		if self.view.window != nil {
			if textView.textColor == UIColor.lightGrayColor() {
				textView.selectedTextRange = textView.textRangeFromPosition(textView.beginningOfDocument, toPosition: textView.beginningOfDocument)
			}
		}
	}
	
}
