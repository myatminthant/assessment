//
//  CartWireFrame.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import Foundation
import UIKit

class CartWireFrame: CartWireFrameProtocol {
    static func createCartModule() -> UIViewController {
        let view = CartController(nibName: "CartController", bundle: nil)
        
        let presenter = CartPresenter()
        let interactor = CartInteractor()
        let wireFrame: CartWireFrameProtocol = CartWireFrame()
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
