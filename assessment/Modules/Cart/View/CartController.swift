//
//  CartController.swift
//  assessment
//
//  Created by Francis on 3/20/22.
//

import UIKit

class CartController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var orderIDLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    var presenter: CartPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupUI()
        orderTableView.dataSource = self
        orderTableView.delegate = self
        orderTableView.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: "ordercell")
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        orderTableView.layoutIfNeeded()
        tableHeightConstraint.constant = self.orderTableView.contentSize.height
    }
    
    func setupUI() {
        addressView.layer.cornerRadius = 3
        addressView.layer.borderWidth = 0.5
        addressView.layer.borderColor = UIColor.systemGray4.cgColor
        totalAmountLabel.text = "24,000"
        backButton.addTarget(self, action: #selector(backToList), for: .touchUpInside)
    }
    
    @objc func backToList() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapCheckOut(_ sender: UIButton) {
        let vc = OrderDetailWireFrame.createOrderDetailModule()
        present(vc, animated: true, completion: nil)
    }
}

extension CartController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ordercell", for: indexPath) as? OrderCell {
            return cell
        }
        return UITableViewCell()
    }
}

extension CartController: CartViewProtocol {
    
}
