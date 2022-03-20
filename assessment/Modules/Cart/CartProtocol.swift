//
//  CartProtocol.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import Foundation
import UIKit

//View
protocol CartViewProtocol {
    var presenter: CartPresenterProtocol? { get set }
}

//Presenter
protocol CartPresenterProtocol {
    var view: CartViewProtocol? { get set }
    var interactor: CartInteractorProtocol? { get set }
    var wireFrame: CartWireFrameProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
}

//Interactor
protocol CartInteractorProtocol {
    var presenter: CartPresenterProtocol? { get set }
}

//Router
protocol CartWireFrameProtocol {
    static func createCartModule() -> UIViewController
}
