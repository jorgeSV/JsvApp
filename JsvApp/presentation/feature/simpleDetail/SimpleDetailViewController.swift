//  
//  SimpleDetailViewController.swift
//  JsvApp
//
//  Created by jorgeSV on 18/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

// MARK: - Model

extension SimpleDetailViewController {
    
    public struct Model {
        
        public enum Product {
            case header(SimpleImageHeaderView.Model)
            case item(SimpleItemListView.Model)
        }
        
        public struct Section {
            var product: [Product]
        }
        
        var sections: [Section]
    }
    
}

class SimpleDetailViewController: BaseViewController {

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
        
        tableView.register(SimpleImageHeaderViewCell.self, forCellReuseIdentifier: SimpleImageHeaderViewCell.identifier)
        tableView.register(SimpleItemListViewCell.self, forCellReuseIdentifier: SimpleItemListViewCell.identifier)
        
        return tableView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.fill(with: tableView)
        return view
    }()
    
    // MARK: - Properties
    
    var sections: [SimpleDetailViewController.Model.Section]
    
    private let presenter: SimpleDetailPresenterProtocol
    
    // MARK: - Initializers
    
    init(_ presenter: SimpleDetailPresenterProtocol) {
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
    
    // MARK: - Functions

}

// MARK: - TableView Methods

extension SimpleDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        case .header(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SimpleImageHeaderViewCell.identifier) as? SimpleImageHeaderViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        case .item(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SimpleItemListViewCell.identifier) as? SimpleItemListViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// MARK: - Presenter Delegate

extension SimpleDetailViewController: SimpleDetailPresenterDelegate {
    
    func refresh() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.sections = self.presenter.sections
            self.tableView.reloadData()
        }
    }
}
