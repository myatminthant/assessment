//
//  ProductInteractor.swift
//  assessment
//
//  Created by Francis on 3/19/22.
//

import Foundation

class ProductInteractor: ProductInteractorProtocol {
    var presenter: ProductPresenterProtocol?
    
    var datamanager: ProductDataManagerProtocol?
    
    func fetchProduct() {
        datamanager?.fetchProduct()
    }
    
    func onSuccess(productModel: [ProductModel]) {
        presenter?.didGetProduct(product: productModel)
    }
    
    func onError(error: String) {
        presenter?.showError(error: error)
    }
}
