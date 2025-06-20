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
        (rawValue + (suffix ?? "")).localize()
    }
}

extension StringKey {
    typealias Generic = GenericStrings
    typealias Error = ErrorStrings
}

enum GenericStrings: String, StringKey {
    case listScreenTitle = "key_screen_list_title"
    case detailsScreenTitle = "key_screen_details_title"
    case ok = "key_ok"
    case followers = "key_followers"
    case language = "key_language_title"
    case stars = "key_stars"
}

enum ErrorStrings: String, StringKey {
    case errorTitle = "key_error_title"
    case emptyResultMessage = "key_empty_result_message"
}
