//
//  LogInDataManager.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import Foundation

class LogInDataManager: LogInDataManagerProtocol {
     
    var interactor: LogInInteractorProtocol?
    
    func login(loginInfo: LogInInfo) {
        CustomLoader.instance.showLoaderView()
        Api.call(.logIn(info: loginInfo), dataType: LogInModel.self) { [weak self] result in
            CustomLoader.instance.hideLoaderView()
            switch result {
            case .success(let res): 
                DataStore.shared.token = res.token
                self?.interactor?.onSuccess()
            case .failure(let error):
                self?.interactor?.onError(error: error.localizedDescription)
            }
        }
    }
}
