//
//  ViewController.swift
//  JsvApp
//
//  Created by jorgeSV on 15/2/23.
//  Copyright © 2023 JSV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: 50))
        label.textAlignment = .center
        label.text = "No Storyboard!"
        return label
      }()
      
      override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(label)
      }


}

