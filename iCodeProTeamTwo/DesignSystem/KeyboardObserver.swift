//
//  KeyboardObserver.swift
//  
//
//  Created by Madina Samadzoda on 18/03/26.
//

import Foundation

import UIKit

final class KeyboardObserver {

    // MARK: - Properties

    var keyboardHeight: CGFloat = 0

    var onKeyboardHeightChanged: ((CGFloat) -> Void)?

    // MARK: - Init

    init() {

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillChangeFrame),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Keyboard Events

    @objc private func keyboardWillShow(_ notification: Notification) {
        updateKeyboardHeight(notification)
    }

    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        updateKeyboardHeight(notification)
    }

    @objc private func keyboardWillHide(_ notification: Notification) {

        keyboardHeight = 0
        onKeyboardHeightChanged?(0)
    }

    // MARK: - Helpers

    private func updateKeyboardHeight(_ notification: Notification) {

        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }

        keyboardHeight = frame.height
        onKeyboardHeightChanged?(frame.height)
    }
}
