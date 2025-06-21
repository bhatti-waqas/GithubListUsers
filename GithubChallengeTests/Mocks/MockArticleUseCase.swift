//
//  MockArticleUseCase.swift
//  iOSEvaluationTests
//
//  Created by Waqas Naseem on 10/01/2024.
//

import Foundation
@testable import iOSEvaluation

final class MockArticleUseCase: ArticleUseCase {
    
    var fetchArticleResult: Result<[Article], Error>!
    
    func fetchArticles() async throws -> [Article] {
        switch fetchArticleResult {
        case .success(let articles):
            return articles
        case .failure(let error):
            throw error
        default:
            preconditionFailure("The mock result for the function shall be populated.")
        }
    }
}
