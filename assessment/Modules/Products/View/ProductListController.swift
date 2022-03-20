//
//  ProductListController.swift
//  assessment
//
//  Created by Francis on 3/19/22.
//

import UIKit


class ProductListController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: ProductPresenterProtocol?
    
    var productList = [ProductModel]()
    
    let collectionViewHeaderReuseIdentifier = "productlistheaderview"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .clear
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(openMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Cart"), style: .plain, target: self, action: #selector(openCart))
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "productcell")
        collectionView.register(UINib(nibName: "ProductHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionViewHeaderReuseIdentifier)
        collectionView.register(UINib(nibName: "SectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionheader")
        presenter?.getProduct()
    }
    
    @objc func openMenu() {
        
    }
    
    @objc func openCart() {
        let vc = CartWireFrame.createCartModule()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1:
            return productList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productcell", for: indexPath) as? ProductCell {
                let product = productList[indexPath.row]
                cell.product = product
                return cell
            }
            return UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionViewHeaderReuseIdentifier, for: indexPath)
                return headerView
            case 1:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionheader", for: indexPath) as! SectionHeader
                sectionHeader.sectionTitleLabel.text = "Recommended Combo"
                return sectionHeader
            default:
                assert(false, "Unexpected element kind")
            }
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 120)
        default:
            return CGSize(width: collectionView.frame.width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = ProductDetailWireFrame.createProductDetailModule() as? ProductDetailController {
            let product = productList[indexPath.row]
            vc.productDetail = product
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ProductListController: ProductViewProtocol {
    func showError(error: String) {
        print(error)
    }
    
    func didGetProduct(productList: [ProductModel]) {
        self.productList = productList
        collectionView.reloadData()
    }
}
