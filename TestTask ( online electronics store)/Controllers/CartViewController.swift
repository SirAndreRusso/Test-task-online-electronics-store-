//
//  CartViewController.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 02.09.2022.
//

import Foundation
import UIKit

class CartViewController: UIViewController, CartVCProtocol {
    
    private var collectionView: UICollectionView?
    var cart: Cart = Cart(products: [Product(productDetails: ProductDetails(cpu: "", camera: "", capacity: [""], color: [""], id: "'", images: [""], isFavorites: false, price: 0, rating: 0, sd: "", ssd: "", title: ""),
                                             delivery: "Free",
                                             count: 0)])
    var cost: Double = 0
    var productCount: Double = 0
    enum Sections: Int, CaseIterable, Hashable {
        case product
    }
    var dataSource: UICollectionViewDiffableDataSource<Sections, AnyHashable>?
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .defaultBackgroundColor()
        setUpNavigationView()
        setUpCollectionView()
        createDiffableDatasource()
        reloadData()
    }
    
    // MARK: - viewWillAppear()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - viewWillDisappear()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    // MARK: - Set up navigation view
    
    private func setUpNavigationView() {
        let navigationView = NavigationView(leftButtonImage: "BackButton", rightButtonImage: "LocationButton", title: "Add address")
        view.addSubview(navigationView)
        navigationView.leftButton.addTarget(self, action: #selector(backToProductDetailsVC), for: .touchUpInside)
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationView.heightAnchor.constraint(equalToConstant: 37),
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 79),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func backToProductDetailsVC() {
        if let tabBar = tabBarController {
            let navC = tabBar.viewControllers?[0] as! UINavigationController
            tabBar.selectedViewController = navC
        } else {
            self.dismiss(animated: true)
        }
    }
    // MARK: - Fetch data
    func fetchData() {
        guard cart.products != [] else {return}
        self.productCount = Double(cart.products[0].count)
        var cost = 0
        if cart.products[0].count > 1 {
            for _ in 1...cart.products[0].count {
                cost += cart.products[0].productDetails.price
            }
        } else if cart.products[0].count == 1 {
            cost = cart.products[0].productDetails.price
        } else {
            return}
        self.cost = Double(cost)
    }
}

// MARK: Set up collection view

extension CartViewController {
    
    private func setUpCollectionView() {
        let layout = createCompositionalLayout()
        print(" \(layout.description)")
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collectionView?.register(CartCell.self, forCellWithReuseIdentifier: CartCell.identifier)
        collectionView?.register(CartFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CartFooter.identifier)
        collectionView?.register(CartHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CartHeader.identifier)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.backgroundColor = .defaultBackgroundColor()
        guard let collection = collectionView else {print("THEre IS NO COLLECTIONVIEW!") ;return }
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//MARK: - Create diffable datasource

extension CartViewController {
    
    private func createDiffableDatasource()  {
        dataSource = UICollectionViewDiffableDataSource<Sections, AnyHashable>(collectionView: collectionView!, cellProvider: {  (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let section = Sections(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")}
            switch section {
            case .product:
                if let product = item as? Product  {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCell.identifier, for: indexPath) as! CartCell
                    cell.configure(title: product.productDetails.title, price: product.productDetails.price, picture: product.productDetails.images[0], count: product.count)
                    print("product.count: \(product.count)")
                    return cell
                } else {
                    return nil}
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let section = Sections(rawValue: indexPath.section)
            else {fatalError("Unknown section kind")}
            if kind == UICollectionView.elementKindSectionHeader {
                guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CartHeader.identifier, for: indexPath) as? CartHeader
                else {fatalError("Can not create new section header")}
                switch section {
                case .product:
                    sectionHeader.configure(text: "My Cart")
                    return sectionHeader
                }
            } else {
                guard let sectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CartFooter.identifier, for: indexPath) as? CartFooter
                else {fatalError("Can not create new section footer")}
                guard let section = Sections(rawValue: indexPath.section)
                else {fatalError("Unknown section kind")}
                switch section {
                    
                case .product:
                    sectionFooter.configure(cost: self.cost)
                    return sectionFooter
                }
            }
        }
    }
    
    func reloadData() {
        fetchData()
        var snapShot = NSDiffableDataSourceSnapshot<Sections, AnyHashable>()
        snapShot.appendSections([Sections.product])
        snapShot.appendItems(cart.products, toSection: .product)
        dataSource?.apply(snapShot, animatingDifferences: false)
    }
}

// MARK: - Create compositional layout

extension CartViewController {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        print("STARTING CREATE COMPOSITIONAL LAYOUT!!")
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 0
        let layout = UICollectionViewCompositionalLayout(section: self.createProductSection(), configuration: config)
        return layout
    }
    
    private func createProductSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupWidth = view.bounds.width
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .estimated(454))
        var count = 1
        if cart.products.count > count {count = cart.products.count}
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: count)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 45
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let sectionHeader = createSectionHeader()
        let sectionFooter = createSectionFooter()
        section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(140))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.extendsBoundary = true
        return sectionHeader
    }
    private func createSectionFooter() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(216))
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionFooterSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        sectionFooter.extendsBoundary = true
        return sectionFooter
    }
}

// MARK: - UICollectionViewDelegate

extension CartViewController: UICollectionViewDelegate{}
