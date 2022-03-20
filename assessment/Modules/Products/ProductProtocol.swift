//
//  ProductProtocol.swift
//  assessment
//
//  Created by Francis on 3/19/22.
//

import Foundation
import UIKit

//View
protocol ProductViewProtocol {

    var presenter: ProductPresenterProtocol? { get set } 
    // PRESENTER <-> VIEW
    func didGetProduct(productList: [ProductModel])
    func showError(error: String) 
}

//Presenter
protocol ProductPresenterProtocol {
    var view: ProductViewProtocol? { get set }
    var interactor: ProductInteractorProtocol? { get set }
    var wireFrame: ProductWireFrameProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showError(error: String)
    //INTERACTOR -> PRESENTER
    func getProduct()
    
    func didGetProduct(product: [ProductModel])
}

//Interactor
protocol ProductInteractorProtocol {
    var presenter: ProductPresenterProtocol? { get set }
    var datamanager: ProductDataManagerProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func fetchProduct() //In
    
    // INTERACTOR -> PRESENTER
//    func didProduct() -> ProductModel //Out
    func onSuccess(productModel: [ProductModel])
    func onError(error: String)
}

protocol ProductDataManagerProtocol {
    var interactor: ProductInteractorProtocol? { get set }
    func fetchProduct()
    
}

//Router 
protocol ProductWireFrameProtocol {
    static func createProductModule() -> UIViewController
}
