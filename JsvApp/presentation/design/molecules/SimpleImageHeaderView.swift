//
//  SimpleImageHeaderView.swift
//  JsvApp
//
//  Created by jorgeSV on 18/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit
import AlamofireImage

public class SimpleImageHeaderViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static var identifier: String {
        String(describing: self)
    }
    
    // MARK: - Views
    
    let view = SimpleImageHeaderView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.fill(with: view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(with model: SimpleImageHeaderView.Model) {
        view.configure(with: model)
        selectionStyle = .none
    }
}


// MARK: - Model

public extension SimpleImageHeaderView {
    
    struct Model {
                
        static let example = Model(
            image: ""
        )
        
        let image: String?

        init(image: String?) {
            self.image = image
        }
    }
}

// MARK: - View Component

public class SimpleImageHeaderView: UIView {
    
    // MARK: - Views
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 360).isActive = true
        return imageView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.fill(with: imageView)
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - Properties
    
    var model: Model = .example
 
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
    
    func configure(with model: Model) {
        self.model = model
        
        if let imageUrl = model.image, let url = URL(string: imageUrl) {
            imageView.af.setImage(withURL: url)
        }
    }
        
}
