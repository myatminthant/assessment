//
//  ProductDetailProtocol.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import Foundation
import UIKit

//View
protocol ProductDetailViewProtocol {

    var presenter: ProductDetailPresenterProtocol? { get set } 
}

//Presenter
protocol ProductDetailPresenterProtocol {
    var view: ProductDetailViewProtocol? { get set }
    var interactor: ProductDetailInteractorProtocol? { get set }
    var wireFrame: ProductDetailWireFrameProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
}

//Interactor
protocol ProductDetailInteractorProtocol {
    var presenter: ProductDetailPresenterProtocol? { get set }
}

//Router
protocol ProductDetailWireFrameProtocol {
    static func createProductDetailModule() -> UIViewController
}
