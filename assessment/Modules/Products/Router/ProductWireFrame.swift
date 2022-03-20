//
//  ProductWireFrame.swift
//  assessment
//
//  Created by Francis on 3/19/22.
//

import Foundation
import UIKit

class ProductWireFrame: ProductWireFrameProtocol {
    static func createProductModule() -> UIViewController {
        let view = ProductListController(nibName: "ProductListController", bundle: nil)
        
        let presenter = ProductPresenter()
        let interactor = ProductInteractor()
        let dataManager = ProductDataManager()
        let wireFrame: ProductWireFrameProtocol = ProductWireFrame()
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.datamanager = dataManager
        dataManager.interactor = interactor
        
        return view
    }
}
