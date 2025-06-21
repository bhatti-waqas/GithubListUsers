//
//  MockResponseBuilder.swift
//  iOSEvaluationTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation
@testable import iOSEvaluation

final class MockResponseBuilder {
    
    static func getMockArticlesResponse() -> ArticleResponse {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "articles_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(ArticleResponse.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockArticleResponseWithEmptyResults() -> ArticleResponse {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "articles_response_empty", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(ArticleResponse.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockArticlesData() -> Data {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "articles_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            fatalError("Error: \(error)")
        }
    }
}

extension ArticleRowViewModel {
    static func mocked() -> ArticleRowViewModel {
        .init(article: Article.mocked())
    }
}

extension Article {
    static func mocked() -> Article {
        .init(id: 0,
              uri: "",
              url: "",
              source: "",
              publishedDate: "2024-01-05",
              section: "U.S",
              nytdSection: "u.s",
              adxKeywords: "Fourteenth Amendment (US Constitution);Presidential Election of 2024",
              byline: "By Adam Liptak",
              type: "Article",
              title: "title", abstract: "The Colorado Supreme Court", media: [])
    }
}
