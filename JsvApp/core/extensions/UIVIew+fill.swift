//
//  UIVIew+fill.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

extension UIView {
    
    func fill(with view: UIView, edges: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        NSLayoutConstraint.activate([
            safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -edges.top),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: edges.bottom),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -edges.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: edges.right)
        ])
    }
    
    func center(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor),
            view.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor)
        ])
    }
}
