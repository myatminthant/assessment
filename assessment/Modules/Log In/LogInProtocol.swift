//
//  Protocol.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation
import UIKit

//View
protocol LogInViewProtocol {

    var presenter: LogInPresenterProtocol? { get set }
    // PRESENTER <-> VIEW
    func didSuccessLogIn()
    func showError(error: String) 
}

//Presenter
protocol LogInPresenterProtocol {
    var view: LogInViewProtocol? { get set }
    var interactor: LogInInteractorProtocol? { get set }
    var wireFrame: LogInWireFrameProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showError(error: String)
    //INTERACTOR -> PRESENTER
    func login(_ model: LogInInfo?)
}

//Interactor
protocol LogInInteractorProtocol {
    var presenter: LogInPresenterProtocol? { get set }
    var datamanager: LogInDataManagerProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func login(loginInfo: LogInInfo) //In
    
    // INTERACTOR -> PRESENTER
    func onSuccess() //Out
    func onError(error: String)
}

protocol LogInDataManagerProtocol {
    var interactor: LogInInteractorProtocol? { get set }
    func login(loginInfo: LogInInfo)
    
}

//Router 
protocol LogInWireFrameProtocol {
    static func createLogInModule() -> UIViewController
}
