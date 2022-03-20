//
//  ProductCell.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import UIKit
import SDWebImage

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    var product: ProductModel? {
        didSet {
            if let imageURLString = product?.image {
                imageView.sd_setImage(with: URL(string: imageURLString), completed: nil)
            }
            titleLabel.text = product?.name
            priceLabel.text = "\(product?.amount ?? 0)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 2
    }

}
