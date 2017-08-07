//
//  ProductsVC.swift
//  coder-swag
//
//  Created by Marcin Pietrzak on 06.08.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    private(set) public var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

        productsCollection.delegate = self
        productsCollection.dataSource = self
    }
    
    func initProduct(category: Category) {
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCellCollectionViewCell {
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            return cell
        }
            
        return ProductCellCollectionViewCell()
    }
    

}
