//
//  Interactor.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation

class LogInInteractor: LogInInteractorProtocol {
    var presenter: LogInPresenterProtocol?
    
    var datamanager: LogInDataManagerProtocol?
    
    func login(loginInfo: LogInInfo) {
        datamanager?.login(loginInfo: loginInfo)
    } 
    
    func onSuccess() {
        presenter?.viewDidLoad()
    }
    
    func onError(error: String) {
        presenter?.showError(error: error)
    } 
}
