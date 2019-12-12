//
//  RecentArticleViewController.swift
//  LobsterMVVMExample
//
//  Created by Jean Pierre Alary on 11/12/2019.
//  Copyright © 2019 Jean-Pierre Alary. All rights reserved.
//

import UIKit
import RxSwift

final class RecentArticleViewController: ViewLifeCycleViewController, LoadingView, UITableViewDataSource {
    private var articles: [RecentArticleViewModel] = []
    private let viewModel: ViewModel<RecentArticleAction, RecentArticleResult>
    
    // MARK: - Outlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var articleList: UITableView!
    
    // MARK: - Initializer
    
    init(viewModel: ViewModel<RecentArticleAction, RecentArticleResult>) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("`RecentArticleViewController` should not be instanciated with interface builder")
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    // MARK: - LoadingView
    
    var loadingViewController: LoadingViewController?
    
    // MARK: - Public
    
    func update(title: String) {
        titleLabel.text = title
    }
    
    func update(articles: [RecentArticleViewModel]) {
        self.articles = articles
        articleList.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentArticleTableViewCell.identifier, for: indexPath) as? RecentArticleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: articles[indexPath.row])
        
        return cell
    }
    
    // MARK: - Private
    
    private func configureSubviews() {
        articleList.register(UINib(nibName: RecentArticleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecentArticleTableViewCell.identifier)
    }
    
    private func bind() {
        let action = RecentArticleAction(
            viewWillAppear: viewLifeCycle.asObservable()
                .filter { .viewWillAppear == $0 }
                .map { _ in }
        )
        
        let result = viewModel
            .transform(action: action)
            .share(replay: 1, scope: .forever)
        
        result
            .map { $0.value() }
            .compactMap { $0 }
            .bind(to: rx.recentTitle)
            .disposed(by: disposeBag)
        
        let articles: Observable<[RecentArticleViewModel]> = result
            .map { $0.value() }
            .compactMap { $0 }
            .share(replay: 1, scope: .forever)
        
        Observable.merge(
            result.filter { .loading == $0 }.map { _ in true },
            articles.map { _ in false }
        )
        .bind(to: rx.loading)
        .disposed(by: disposeBag)
            
        articles
            .bind(to: rx.reloadArticles)
            .disposed(by: disposeBag)
    }
}
