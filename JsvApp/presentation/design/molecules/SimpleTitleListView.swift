//
//  SimpleTitleListView.swift
//  JsvApp
//
//  Created by jorgeSV on 23/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

public class SimpleTitleListViewHeader: UITableViewHeaderFooterView {
    
    static var identifier: String {
        String(describing: self)
    }
    
    let view = SimpleTitleListView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.fill(with: view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: SimpleTitleListView.Model) {
        view.configure(with: model)
    }
}

public extension SimpleTitleListView {
    
    struct Model {
        static let example = Model(title: "Section Title")
        
        var title: String
        
        init(title: String) {
            self.title = title
        }
    }
}

public class SimpleTitleListView: UIView {
    
    // MARK: - Properties
    
    private var model: Model = .example
    
    // MARK: - Views
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var mainView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            UIView(),
            titleLabel,
            UIView()
        ])
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Initializers
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        fill(with: mainView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fill(with: mainView)
    }
    
    // MARK: - Configure
    
    func configure(with model: Model) {
        self.model = model
        titleLabel.text = model.title
    }
}
