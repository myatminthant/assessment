//
//  OrderDetailController.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import UIKit

class OrderDetailController: UIViewController {

    var presenter: OrderDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } 
}

extension OrderDetailController: OrderDetailViewProtocol {
    
}
