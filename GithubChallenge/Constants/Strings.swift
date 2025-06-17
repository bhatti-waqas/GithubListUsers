//
//  Strings.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation
import Extensions

protocol StringKey {
    var rawValue: String { get }
    func get(suffix: String?) -> String
}

extension StringKey {
    func get(suffix: String? = nil) -> String {
        return (rawValue + (suffix ?? "")).localize()
    }
}

extension StringKey {
    typealias Generic = GenericStrings
    typealias Error = ErrorStrings
}

enum GenericStrings: String, StringKey {
    case screenTitle = "key_screen_title"
    case textFieldPlaceHolder = "key_text_field_placeholder"
    case actionSheetTitle = "key_title_action_sheet"
    case actionSheetMessage = "key_message_action_sheet"
    case ok = "key_ok"
}

enum ErrorStrings: String, StringKey {
    case errorTitle = "key_error_title"
    case emptyResultMessage = "key_empty_result_message"
}
