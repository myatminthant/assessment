//
//  Router.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation
import UIKit

class LogInWireFrame: LogInWireFrameProtocol {
    static func createLogInModule() -> UIViewController {
        let view = LogInController(nibName: "LogInController", bundle: nil)
        
        let presenter = LogInPresenter()
        let interactor = LogInInteractor()
        let dataManager = LogInDataManager()
        let wireFrame: LogInWireFrameProtocol = LogInWireFrame()
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
