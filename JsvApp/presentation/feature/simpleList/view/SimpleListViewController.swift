//  
//  SimpleListViewController.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

// MARK: - Model

extension SimpleListViewController {
    
    public struct Model {
        
        public enum Product {
            case item(SimpleItemListView.Model)
            case loading
        }
        
        public struct Section {
            var product: [Product]
        }
        
        var sections: [Section]
    }
    
}

class SimpleListViewController: BaseViewController {

    // MARK: - Views
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = true
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        tableView.register(SimpleItemListViewCell.self, forCellReuseIdentifier: SimpleItemListViewCell.identifier)
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.identifier)
        
        return tableView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.fill(with: tableView)
        return view
    }()
    
    // MARK: - Properties
    
    var sections: [SimpleListViewController.Model.Section]
    
    private var presenter: SimpleListPresenterProtocol
    
    // MARK: - Initializers
    
    public init(_ presenter: SimpleListPresenterProtocol) {
        self.presenter = presenter
        self.sections = presenter.sections
        
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This init has not been implemented. Use init(:Presenter) instead.")
    }
    
    // MARK: - Setup UI
    
    override public func loadView() {
        super.loadView()
        view.backgroundColor = .white
        title = presenter.title
    }
    
    // MARK: - Life cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
        view.fill(with: mainView)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

// MARK: - TableView Methods

extension SimpleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].product.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections.isEmpty {
            return UITableViewCell()
        }
        
        let section = sections[indexPath.section]
        
        switch section.product[indexPath.row] {
        case .item(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SimpleItemListViewCell.identifier) as? SimpleItemListViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        case .loading:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.identifier) as? LoadingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure()
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell is LoadingTableViewCell {
            presenter.loadMoreItems()
        }
    }
}

// MARK: - Presenter Delegate

extension SimpleListViewController: SimpleListPresenterDelegate {
    
    public func refresh() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.sections = self.presenter.sections
            self.tableView.reloadData()
        }
    }
    
}
