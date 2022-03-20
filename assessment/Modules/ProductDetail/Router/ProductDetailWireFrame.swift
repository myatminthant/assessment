//
//  ProductDetailWireFrame.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import Foundation
import UIKit

class ProductDetailWireFrame: ProductDetailWireFrameProtocol {
    static func createProductDetailModule() -> UIViewController {
        let view = ProductDetailController(nibName: "ProductDetailController", bundle: nil)
        
        let presenter = ProductDetailPresenter()
        let interactor = ProductDetailInteractor()
        let wireFrame: ProductDetailWireFrameProtocol = ProductDetailWireFrame()
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter  
        
        return view
    }
}
