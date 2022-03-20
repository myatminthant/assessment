//
//  OrderDetailWireFrame.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import Foundation
import UIKit

class OrderDetailWireFrame: OrderDetailWireFrameProtocol {
    static func createOrderDetailModule() -> UIViewController {
        let view = OrderDetailController(nibName: "OrderDetailController", bundle: nil)
        
        let presenter = OrderDetailPresenter()
        let interactor = OrderDetailInteractor()
        let wireFrame: OrderDetailWireFrameProtocol = OrderDetailWireFrame()
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
