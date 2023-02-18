//
//  SimpleItemListView.swift
//  JsvApp
//
//  Created by jorgeSV on 17/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit
import AlamofireImage

public class SimpleItemListViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static var identifier: String {
        String(describing: self)
    }
    
    // MARK: - Views
    
    let view = SimpleItemListView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.fill(with: view, edges: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(with model: SimpleItemListView.Model) {
        view.configure(with: model)
        selectionStyle = .none
    }
}


// MARK: - Model

public extension SimpleItemListView {
    
    struct Model {
                
        public typealias Action = (Model) -> Void
        
        static let example = Model(
            title: "NO NAME", image: "", action: { _ in }
        )
        
        let title: String
        let image: String?
        let action: Action

        init(title: String,
             image: String?,
             action: @escaping Action) {
            self.title = title
            self.image = image
            self.action = action
        }
    }
}

// MARK: - View Component

public class SimpleItemListView: UIView {
    
    // MARK: - Views
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 48),
            imageView.widthAnchor.constraint(equalToConstant: 48)
        ])
        imageView.layer.cornerRadius = 24
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            titleLabel,
            UIView()
        ])
        stackView.spacing = 16
        stackView.alignment = .center
        
        return stackView
    }()
    
    lazy var mainView: UIView = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        let view = UIView()
        view.fill(with: mainStackView, edges: .init(top: 16, left: 0, bottom: 16, right: 0))
        view.fill(with: button)
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - Properties
    
    var model: Model = .example
    var action: Model.Action?
 
    // MARK: - Initialization
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        fill(with: mainView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        fill(with: mainView)
    }
    
    // MARK: - Action
    
    @objc func didTapButton() {
        action?(model)
    }
    
    // MARK: - Configure
    
    func configure(with model: Model) {
        self.model = model
        
        titleLabel.text = model.title
        action = model.action
        
        if let imageUrl = model.image, let url = URL(string: imageUrl) {
            imageView.isHidden = false
            imageView.af.setImage(withURL: url)
        } else {
            imageView.isHidden = true
        }
    }
        
}
