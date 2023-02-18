//
//  LoadingView.swift
//  JsvApp
//
//  Created by jorgeSV on 18/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

public class LoadingTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static var identifier: String {
        String(describing: self)
    }
    
    // MARK: - Views
    
    let view = LoadingView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.fill(with: view, edges: UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure() {
        view.configure()
        selectionStyle = .none
    }
}

// MARK: - View Component

public class LoadingView: UIView {
    
    // MARK: - Views
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView.init(style: .medium)
        return activityIndicator
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.center(view: activityIndicator)
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        fill(with: mainView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        fill(with: mainView)
    }
    
    // MARK: - Configure
    
    func configure() {
        activityIndicator.startAnimating()
    }
        
}
