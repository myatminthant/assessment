//
//  ProductDataManager.swift
//  assessment
//
//  Created by Francis on 3/19/22.
//

import Foundation

class ProductDataManager: ProductDataManagerProtocol {
     
    var interactor: ProductInteractorProtocol?
    
    func fetchProduct() {
        CustomLoader.instance.showLoaderView()
        Api.call(.products, dataType: ResultResponse<[ProductModel]>.self) { [weak self] result in
            CustomLoader.instance.hideLoaderView()
            switch result {
            case .success(let res):
                self?.interactor?.onSuccess(productModel: res.content)
            case .failure(let error):
                self?.interactor?.onError(error: error.localizedDescription)
            }
        }
    }
}
