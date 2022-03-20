//
//  ProductHeaderView.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import UIKit

class ProductHeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let width = searchField.frame.height
        searchField.leftViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width + 10, height: width))
        let imageView = UIImageView(image: UIImage(named: "search"))
        imageView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        view.addSubview(imageView)
        searchField.leftView = view
    }
    
}
