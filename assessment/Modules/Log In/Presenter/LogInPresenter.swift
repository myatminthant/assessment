//
//  Presenter.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation

class LogInPresenter: LogInPresenterProtocol {
    var view: LogInViewProtocol?
    
    var interactor: LogInInteractorProtocol?
    
    var wireFrame: LogInWireFrameProtocol?
    
    func viewDidLoad() {
        view?.didSuccessLogIn()
    } 
    
    func showError(error: String) {
        view?.showError(error: error)
    }
    
    func login(_ model: LogInInfo?) {
        guard let model = model else {
            showError(error: "")
            return
        }
        interactor?.login(loginInfo: model)
    }
}
