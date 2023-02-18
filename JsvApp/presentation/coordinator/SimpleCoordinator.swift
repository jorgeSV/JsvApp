//
//  SimpleCoordinator.swift
//  JsvApp
//
//  Created by jorgeSV on 16/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

public class SimpleCoordinator: Coordinator {
   
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private var childCoordinator: Coordinator?
    private let simpleDependencies: SimpleDependencies = SimpleDependencies()
    static var containerView: UIViewController?
    
    // MARK: - Init
    
    public init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    
    public func resolve() {
        openSimpleListContainerView()
    }
    
    // MARK: - SimpleCoordinatorProtocol Functions
    
    func openSimpleListContainerView() {
        let viewController = simpleDependencies.makeSimpleListView(self)
        SimpleCoordinator.containerView = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func openSimpleDetailContainerView(selectedItem: SimpleListItem) {
        let viewController = simpleDependencies.makeSimpleDetailView(self, selectedItem: selectedItem)
        SimpleCoordinator.containerView = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - SimpleListSignalDelegate

extension SimpleCoordinator: SimpleListSignalDelegate {
    
    public func signalTrigged(_ signal: SimpleListSignal) {
        switch signal {
        case .openDetail(let model):
            openSimpleDetailContainerView(selectedItem: model)
        }
    }
}

extension SimpleCoordinator: SimpleDetailSignalDelegate {
    
    func signalTrigged(_ signal: SimpleDetailSignal) {
        
    }
}
