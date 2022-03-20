//
//  ProductDetailController.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import UIKit
import SDWebImage

class ProductDetailController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCountView: UIView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet var sizeButtons: [UIButton]!
    
    var presenter: ProductDetailPresenterProtocol?
    
    var productDetail: ProductModel!
    
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindData()
    }

    func setupUI() {
        sizeButtons.forEach { button in
            button.layer.cornerRadius = button.frame.height / 2
        }
        productCountView.layer.cornerRadius = 2
        countLabel.text = "\(count)"
        minusButton.tintColor = count == 1 ? .lightGray : .white
        plusButton.tintColor = count == 5 ? .lightGray : .white
        plusButton.addTarget(self, action: #selector(plus), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minus), for: .touchUpInside)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backToList), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func bindData() {
        if let imageURLString = productDetail?.image {
            productImage.sd_setImage(with: URL(string: imageURLString), completed: nil)
        }
        productNameLabel.text = productDetail.name
        descriptionLabel.text = productDetail.description
        amountLabel.text = "\(productDetail.amount ?? 0) MMK"
    }
    
    @objc func backToList() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func plus() {
        count += 1
        calculate()
        countLabel.text = "\(count)"
    }
    
    @objc func minus() {
        count -= 1
        calculate()
        countLabel.text = "\(count)"
    }
    
    func calculate() {
        if count == 1 {
            minusButton.tintColor = .lightGray
            minusButton.isEnabled = false
        } else {
            minusButton.tintColor = .white
            minusButton.isEnabled = true
        }
        
        if count == 5 {
            plusButton.tintColor = .lightGray
            plusButton.isEnabled = false
        } else {
            plusButton.tintColor = .white
            plusButton.isEnabled = true
        }
    }
}

extension ProductDetailController: ProductDetailViewProtocol {
    
}
