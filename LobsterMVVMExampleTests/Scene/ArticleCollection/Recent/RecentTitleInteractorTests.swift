//
//  RecentTitleInteractorTests.swift
//  LobsterMVVMExampleTests
//
//  Created by Jean Pierre Alary on 12/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

@testable import LobsterMVVMExample
import XCTest
import RxSwift

final class RecentTitleInteractorTests: XCTestCase {
    
    func test_givenMockLocalization_whenPerformViewWillAppearAction_thenShouldReturnTitleCase() {
        let disposeBag = DisposeBag()
        
        // Given
        let interactor = RecentTitleInteractor(localization: MockLocalization())
        
        // When
        var results: [RecentArticleResult] = []
        interactor
            .perform(action: .viewWillAppear)
            .subscribe(onNext: { result in
                results.append(result)
            })
            .disposed(by: disposeBag)
        
        // Then
        XCTAssertEqual(
            [.recentTitle("scene.article.collection.recent.label.title")],
            results
        )
    }
}
