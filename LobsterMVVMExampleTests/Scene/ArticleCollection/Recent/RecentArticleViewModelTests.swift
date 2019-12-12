//
//  RecentArticleViewModelTests.swift
//  LobsterMVVMExampleTests
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

@testable import LobsterMVVMExample
import XCTest

final class RecentArticleViewModelTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_givenDefaultArticleStub_whenGetTitle_thenShouldReturnStubbedValue() {
        // Given
        let viewModel = RecentArticleViewModel(localization: MockLocalization(), article: Article.defaultStub)
        
        // When
        let title = viewModel.title
        
        // Then
        XCTAssertEqual(Article.defaultStub.title, title)
    }
    
    func test_givenDefaultArticleStub_whenGetTags_thenShouldReturnStubbedValuesJoined() {
        // Given
        let viewModel = RecentArticleViewModel(localization: MockLocalization(), article: Article.defaultStub)
        
        // When
        let tags = viewModel.tags
        
        // Then
        XCTAssertEqual(Article.defaultStub.tags.joined(separator: ", "), tags)
    }
    
    func test_givenDefaultArticleStub_whenGetAuthorName_thenShouldReturnStubbedValueTranslated() {
        // Given
        let viewModel = RecentArticleViewModel(localization: MockLocalization(), article: Article.defaultStub)
        
        // When
        let authorName = viewModel.authorName
        
        // Then
        XCTAssertEqual(
            "scene.article.collection.recent.cell.label.author_" + Article.defaultStub.submitterUser.username,
            authorName
        )
    }
}
