//
//  OrderDetailProtocol.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import Foundation
import UIKit

//View
protocol OrderDetailViewProtocol {
    var presenter: OrderDetailPresenterProtocol? { get set }
}

//Presenter
protocol OrderDetailPresenterProtocol {
    var view: OrderDetailViewProtocol? { get set }
    var interactor: OrderDetailInteractorProtocol? { get set }
    var wireFrame: OrderDetailWireFrameProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
}

//Interactor
protocol OrderDetailInteractorProtocol {
    var presenter: OrderDetailPresenterProtocol? { get set }
}

//Router
protocol OrderDetailWireFrameProtocol {
    static func createOrderDetailModule() -> UIViewController
}
