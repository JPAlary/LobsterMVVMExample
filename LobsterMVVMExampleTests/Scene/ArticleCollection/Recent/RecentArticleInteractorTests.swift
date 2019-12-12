//
//  RecentArticleInteractorTests.swift
//  LobsterMVVMExampleTests
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

@testable import LobsterMVVMExample
import XCTest
import RxSwift

final class RecentArticleInteractorTests: XCTestCase {
    
    func test_givenErrorFromRepository_whenViewWillAppearActionIsTriggered_thenShouldReturnLoadingAndErrorCases() {
        let disposeBag = DisposeBag()
        let viewWillAppear = PublishSubject<Void>()
        
        // Given
        let interactor = RecentArticleInteractor(
            repository: MockArticleCollectionRepository(getLatest: .just(.error(StubAppError()))),
            localization: MockLocalization()
        )
        var results: [RecentArticleResult] = []
        interactor
            .perform(action: RecentArticleAction(viewWillAppear: viewWillAppear))
            .subscribe(onNext: { result in
                results.append(result)
            })
            .disposed(by: disposeBag)

        // When
        viewWillAppear.onNext(())
        
        // Then
        XCTAssertEqual(
            [
                .loading,
                .error(message: StubAppError().message(with: MockLocalization())),
            ],
            results
        )
    }
    
    func test_givenNotFoundFromRepository_whenViewWillAppearActionIsTriggered_thenShouldReturnLoadingAndErrorCases() {
        let disposeBag = DisposeBag()
        let viewWillAppear = PublishSubject<Void>()
        
        // Given
        let interactor = RecentArticleInteractor(
            repository: MockArticleCollectionRepository(getLatest: .just(.notFound)),
            localization: MockLocalization()
        )
        var results: [RecentArticleResult] = []
        interactor
            .perform(action: RecentArticleAction(viewWillAppear: viewWillAppear))
            .subscribe(onNext: { result in
                results.append(result)
            })
            .disposed(by: disposeBag)
            
        // When
        viewWillAppear.onNext(())
        
        // Then
        XCTAssertEqual(
            [
                .loading,
                .error(message: "scene.article.collection.recent.empty_collection"),
            ],
            results
        )
    }
    
    func test_givenArticlesFromRepository_whenViewWillAppearActionIsTriggered_thenShouldReturnLoadingAndArticleCases() {
        let disposeBag = DisposeBag()
        let viewWillAppear = PublishSubject<Void>()
        
        // Given
        let interactor = RecentArticleInteractor(
            repository: MockArticleCollectionRepository(getLatest: .just(.value([Article.defaultStub, Article.defaultStub]))),
            localization: MockLocalization()
        )
        var results: [RecentArticleResult] = []
        interactor
            .perform(action: RecentArticleAction(viewWillAppear: viewWillAppear))
            .subscribe(onNext: { result in
                results.append(result)
            })
            .disposed(by: disposeBag)
        
        // When
        viewWillAppear.onNext(())
        
        // Then
        XCTAssertEqual(
            [
                .loading,
                .articles([
                    RecentArticleViewModel(localization: MockLocalization(), article: Article.defaultStub),
                    RecentArticleViewModel(localization: MockLocalization(), article: Article.defaultStub),
                ])
            ],
            results
        )
    }
}
