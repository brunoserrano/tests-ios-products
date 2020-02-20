//
//  ViewController.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 16/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?

    @IBOutlet var productTableView: UITableView!
    var productArrayList: Array<ProductModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Products"
        
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchProducts()
    }
    
    func fetchProducts() {
        presenter?.startFetchingProduct()
        self.showProgressIndicator(view: self.view)
    }
}

extension ProductViewController: PresenterToViewProtocol {
    func showProduct(productArray: Array<ProductModel>) {
        self.productArrayList = productArray
        self.productTableView.reloadData()
        self.hideProgressIndicator(view: self.view)
    }
    
    func showError() {
        self.hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Oops!", message: "Unable to fetch products.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { _ in self.fetchProducts()}))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        let item = productArrayList[indexPath.row]
        cell.textLabel?.text = item.name
        
        if let price = item.price {
            cell.detailTextLabel?.text = price.toCurrencyString(currencySymbol: "$")
        }
        else {
            cell.detailTextLabel?.text = "???"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailController(navigationController: self.navigationController!)
    }
}

class ProductCell: UITableViewCell {
    
}

