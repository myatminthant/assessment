//
//  CustomLoader.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import Foundation
import UIKit

class CustomLoader: UIView {
    
    static let instance = CustomLoader()
    
    var viewColor: UIColor = .black
    var setAlpha: CGFloat = 0.5
    var gifName: String = "adsmodo_loading"
    
    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        transparentView.backgroundColor = viewColor.withAlphaComponent(setAlpha)
        transparentView.isUserInteractionEnabled = true
        return transparentView
    }() 
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        var spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        return spinner
    }()
    
    func showLoaderView() {
        self.addSubview(self.transparentView)
        self.transparentView.addSubview(self.activityIndicator)
        self.transparentView.bringSubviewToFront(self.activityIndicator)
        UIApplication.shared.keyWindow?.addSubview(transparentView)
        activityIndicator.centerXAnchor.constraint(equalTo: transparentView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: transparentView.centerYAnchor).isActive = true
    }
    
    func hideLoaderView() {
        self.transparentView.removeFromSuperview()
    }
    
}
