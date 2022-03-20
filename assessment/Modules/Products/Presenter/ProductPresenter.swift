//
//  ProductPresenter.swift
//  assessment
//
//  Created by Francis on 3/19/22.
//

import Foundation

class ProductPresenter: ProductPresenterProtocol {
    var view: ProductViewProtocol?
    
    var interactor: ProductInteractorProtocol?
    
    var wireFrame: ProductWireFrameProtocol? 
    
    func viewDidLoad() {
        
    }
    
    func showError(error: String) {
        view?.showError(error: error)
    }
    
    func didGetProduct(product: [ProductModel]) {
        view?.didGetProduct(productList: product)
    }
    
    func getProduct() {
        interactor?.fetchProduct()
    }
    
    
}
