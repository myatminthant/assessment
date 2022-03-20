//
//  LogInController.swift
//  assessment
//
//  Created by Francis on 3/18/22.
//

import UIKit 

class LogInController: UIViewController {
     
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    lazy var eyeButton: UIButton = {
        let button = UIButton()
        let eyeImage = UIImage(systemName: "eye")
        button.setImage(eyeImage, for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        return button
    }()
    
    var presenter: LogInPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {
        passwordField.rightViewMode = .always
        passwordField.rightView = eyeButton
        
        logInButton.layer.cornerRadius = 5
    }
    
    @objc func showHidePassword() {
        
    }

    @IBAction func didTapLogIn(_ sender: UIButton) {
        let loginInfo = LogInInfo(username: "mmt", password: "1234")
        presenter?.login(loginInfo)
    }
}

extension LogInController: LogInViewProtocol {
    func showError(error: String) {
        print(error)
    }
    
    func didSuccessLogIn() {
        let vc = ProductWireFrame.createProductModule()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
}
