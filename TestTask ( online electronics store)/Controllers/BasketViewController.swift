//
//  BasketViewController.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 02.09.2022.
//

import Foundation
import UIKit

class BasketViewController: UIViewController, BasketVCProtocol {
    
    private var collectionView: UICollectionView?
    
    var basket: Basket?
    var products: [Product]? {
        guard let basket = basket else {
            return nil
        }
        return basket.basket
    }
    
    enum Sections: Int, CaseIterable, Hashable {
        case product
    }
    var dataSource: UICollectionViewDiffableDataSource<Sections, AnyHashable>?
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .defaultBackgroundColor()
        fetchBasket()
        print("sdcdf \(basket?.total)")
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
    
    // MARK: - viewDidAppear()
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.items![1].badgeValue = nil
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
    
    private func fetchBasket() {
        NetworkManager.shared.fetchBasket { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let basket):
                self.basket = basket
                print(basket.delivery)
                self.reloadData()
            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
        }
    }
}

// MARK: Set up collection view

extension BasketViewController {
    
    private func setUpCollectionView() {
        let layout = createCompositionalLayout()
        print(" \(layout.description)")
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collectionView?.register(BasketCell.self, forCellWithReuseIdentifier: BasketCell.identifier)
        collectionView?.register(BasketFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BasketFooter.identifier)
        collectionView?.register(BasketHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BasketHeader.identifier)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.backgroundColor = .defaultBackgroundColor()
        
        guard let collection = collectionView else {print("Collection view is Nil") ;return }
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//MARK: - Create diffable datasource

extension BasketViewController {
    
    private func createDiffableDatasource()  {
        dataSource = UICollectionViewDiffableDataSource<Sections, AnyHashable>(collectionView: collectionView!, cellProvider: {  [weak self](collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let self = self else {return nil}
            guard let section = Sections(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")}
            switch section {
            case .product:
                if let product = item as? Product  {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketCell.identifier, for: indexPath) as! BasketCell
                    cell.configure(title: product.title, price: product.price, picture: product.images, count: 1)
//                    cell.plusButton.addTarget(self, action: #selector(self.plusAction), for: .touchUpInside)
//                    cell.minusButton.addTarget(self, action: #selector(self.minusAction), for: .touchUpInside)
//                    cell.deleteButton.addTarget(self, action: #selector(self.deleteAction), for: .touchUpInside)
                    return cell
                } else {
                    return nil}
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            
            [weak self] collectionView, kind, indexPath in
            print("Supplementary is updating")
            guard let self = self else {print("Self is nil"); return nil}
            guard let section = Sections(rawValue: indexPath.section)
            else {fatalError("Unknown section kind")}
            
            if kind == UICollectionView.elementKindSectionFooter {
                print("Footer is HERR")
                guard let sectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BasketFooter.identifier, for: indexPath) as? BasketFooter
                else {fatalError("Can not create new section footer")}
                print("WTF")
                guard let section = Sections(rawValue: indexPath.section)
                else {fatalError("Unknown section kind")}
                switch section {
                case .product:
                    guard let basket = self.basket else {return nil}
                    print("Footer is updating")
                    sectionFooter.configure(cost: Double(basket.total))
                    return sectionFooter
                }
            }
            
            if kind == UICollectionView.elementKindSectionHeader {
                print("HEADER IS HERR")
                guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BasketHeader.identifier, for: indexPath) as? BasketHeader
                else {fatalError("Can not create new section header")}
                switch section {
                case .product:
                    
                    sectionHeader.configure(text: "My Cart")
                    return sectionHeader
                }
            }
          
            return nil
        }
    }
    
    func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<Sections, AnyHashable>()
        if basket != nil {
        snapShot.appendSections([Sections.product])
            snapShot.appendItems(basket!.basket, toSection: .product)
        dataSource?.applySnapshotUsingReloadData(snapShot)
        }
    }
}

// MARK: - Create compositional layout

extension BasketViewController {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 0
        let layout = UICollectionViewCompositionalLayout(section: self.createProductSection(), configuration: config)
        return layout
    }
    
    private func createProductSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(134))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupWidth = view.bounds.width
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .estimated(454))
//        var count = 1
//        if basket != nil {
//        count = basket!.basket.count
//        }
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let sectionHeader = createSectionHeader()
        let sectionFooter = createSectionFooter()
        section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(220))
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



//extension CartViewController {
//    @objc private func plusAction() {
//        print("\(self.cart.products[0].totalCost)")
//        self.cart.products[0].count += 1
//        print("\(self.cart.products[0].totalCost)")
//        reloadData()
//    }
//
//    @objc private func minusAction() {
//        print("\(self.cart.products[0].totalCost)")
//        if cart.products[0].count > 0 {
//        self.cart.products[0].count -= 1
//            print("\(self.cart.products[0].totalCost)")
//            reloadData()
//        }
//        reloadData()
//    }
//
//    @objc private func deleteAction() {
//        print("\(self.cart.products[0].totalCost)")
//        self.cart.products[0].count = 0
//        print("\(self.cart.products[0].totalCost)")
//        reloadData()
//    }
//}

// MARK: - UICollectionViewDelegate

extension BasketViewController: UICollectionViewDelegate{}

