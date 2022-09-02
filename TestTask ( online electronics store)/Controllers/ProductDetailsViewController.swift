//
//  ProductDetailsViewController.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import Foundation
import UIKit
import SDWebImage

class ProductDetailsViewController: UIViewController {
    private var productDetails: ProductDetails?
    private var productImages: [String]?
    private var productColors: [String]?
    private var productCapacity: [String]?
    
    private var collectionView: UICollectionView?
    
    enum SectionTypes: Int, CaseIterable, Hashable {
        case productImageSection
        case productDetailsSection
    }
    var dataSource: UICollectionViewDiffableDataSource<SectionTypes, AnyHashable>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        createDiffableDatasource()
        //        setUpNavigationBar()
        addNavigationView()
        view.backgroundColor = .defaultBackgroundColor()
    }
    
// MARK: - Hide navigation bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func addNavigationView() {
        let navigationView = NavigationView()
        view.addSubview(navigationView)
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        if navigationController?.viewControllers.last is ProductDetailsViewController {
        navigationView.leftButton.addTarget(self, action: #selector(backToMainVC), for: .touchUpInside)
        } else {
            navigationView.leftButton.addAction(UIAction(handler: { _ in
                self.dismiss(animated: true)
            }), for: .touchUpInside)
        }
        if navigationController?.viewControllers.last is ProductDetailsViewController {
        navigationView.rightButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        } else {
            navigationView.rightButton.addAction(UIAction(handler: { _ in
                let cartVC = CartViewController()
                cartVC.modalPresentationStyle = .fullScreen
                self.present(cartVC, animated: true)
            }), for: .touchUpInside)
        }
        
        NSLayoutConstraint.activate([
        navigationView.heightAnchor.constraint(equalToConstant: 37),
        navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 79),
        navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc private func backToMainVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func goToCart() {
        let cartVC = CartViewController()
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
    private func setUpCollectionView() {
        let layout = createCompositionalLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collectionView?.register(ProductImageCell.self, forCellWithReuseIdentifier: ProductImageCell.identifier)
        collectionView?.register(ProductDetailsCell.self, forCellWithReuseIdentifier: ProductDetailsCell.identifier)
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.backgroundColor = .defaultBackgroundColor()
        guard let collection = collectionView else { return }
        view.addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 126).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            guard let section = SectionTypes(rawValue: sectionIndex) else { fatalError("Unknown section")}
            switch section {
            case .productImageSection:
                return self.createProductImageSection()
            case .productDetailsSection:
                return self.createProductDetailsSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 0
        layout.configuration = config
        return layout
    }
    
    private func createProductImageSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let width = CGFloat(view.bounds.width) - 98
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(335))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        print("Section is made")
        return section
    }
    
    private func createProductDetailsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(450))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        print("Section is made")
        return section
    }
    
    private func reloadData() {
        guard let productImages = self.productImages,
              let productDetails = self.productDetails else {return}
        var snapShop = NSDiffableDataSourceSnapshot<SectionTypes, AnyHashable>()
        snapShop.appendSections([.productImageSection, .productDetailsSection])
        snapShop.appendItems(productImages, toSection: .productImageSection)
        snapShop.appendItems([productDetails], toSection: .productDetailsSection)
        dataSource?.apply(snapShop, animatingDifferences: true)
    }
    
    private func createDiffableDatasource()  {
        fetchData()
        dataSource = UICollectionViewDiffableDataSource<SectionTypes, AnyHashable>(collectionView: collectionView!, cellProvider: {  (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let section = SectionTypes(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")}
            switch section {
            case .productImageSection:
                if let productImage = item as? String {
                    
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImageCell.identifier, for: indexPath) as! ProductImageCell
                    cell.configure(picture: productImage)
                    print("imagelink: \(productImage)")
                    return cell
                    
                } else { print("something wrong") ; return nil}
            case .productDetailsSection:
                if let productDetails = item as? ProductDetails {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailsCell.identifier, for: indexPath) as! ProductDetailsCell
                    cell.configure(title: productDetails.title, isFavourites: productDetails.isFavorites, rating: productDetails.rating, cpu: productDetails.cpu, camera: productDetails.camera, ssd: productDetails.ssd, sd: productDetails.sd, price: productDetails.price)
                    print("GOT PRODUCTDETAILS CELL!!!")
                    return cell
                } else { print("something wrong") ; return nil}
            }
        })
//        dataSource?.supplementaryViewProvider = {
//            collectionView, kind, indexPath in
//            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainVCSectionHeader.identifier, for: indexPath) as? MainVCSectionHeader
//            else {fatalError("Can not create new section header")}
//            guard let section = SectionTypes(rawValue: indexPath.section)
//            else {fatalError("Unknown section kind")}
//            switch section {
//            case .categories:
//                sectionHeader.configure(titleLabel: "Select Category", buttonTitle: "view all")
//                return sectionHeader
//            case .hotSales:
//                sectionHeader.configure(titleLabel: "Hot Sales", buttonTitle: "see more")
//                return sectionHeader
//            case .bestSeller:
//                sectionHeader.configure(titleLabel: "Best Seller", buttonTitle: "see more")
//                return sectionHeader
//            }
//        }
    }
    private func fetchData() {
        NetworkManager.shared.fetchProductDetails { [weak self] result in
            guard let self = self else {return}
            switch result {
                
            case .success(let productDetails):
                self.productDetails = productDetails
                self.productImages = productDetails.images
                self.productColors = productDetails.color
                self.productCapacity = productDetails.capacity
                print("product images count: \(self.productImages!.count)")
                print("product Colors count: \(self.productColors!.count)")
                print("product Capacity count: \(self.productCapacity!.count)")
                self.reloadData()
            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
        }
    }
    
}

extension ProductDetailsViewController: UICollectionViewDelegate {}
