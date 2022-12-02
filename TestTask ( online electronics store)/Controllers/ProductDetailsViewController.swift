//
//  ProductDetailsViewController.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import Foundation
import UIKit
import SDWebImage

class ProductDetailsViewController: UIViewController, CoordinatingProtocol {
    var coordinator: Coordinator?
    
    var productDetails: ProductDetails?
    
    // Костыльное решение, так как API не предоставляет цену со скидкой для экрана Product details
    var discountPrice: Int?
    private var productImages: [String]?
    private var productColors: [String]?
    private var productCapacity: [String]?
    private var productCount: Int = 0
    private var collectionView: UICollectionView?
    enum SectionTypes: Int, CaseIterable, Hashable {
        case productImageSection
        case productDetailsSection
    }
    var dataSource: UICollectionViewDiffableDataSource<SectionTypes, AnyHashable>?
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        createDiffableDatasource()
        addNavigationView()
        view.backgroundColor = .defaultBackgroundColor()
    }
    
    // MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - viewWillDisappear
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Add navigation
    
    private func addNavigationView() {
        let navigationView = NavigationView()
        view.addSubview(navigationView)
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        if navigationController?.viewControllers.last is ProductDetailsViewController {
            navigationView.rightButton.addTarget(self, action: #selector(goTobasket), for: .touchUpInside)
            navigationView.leftButton.addTarget(self, action: #selector(backToMainVC), for: .touchUpInside)
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
    
    @objc private func goTobasket() {
        coordinator?.eventOccured(with: .goToBasketVC)
    }
    
    @objc private func addToCart() {
            productCount += 1
            tabBarController?.tabBar.items![1].badgeValue = String(productCount)
    }
    
    // MARK: - Fetch data
    
     func fetchData() {
        NetworkManager.shared.fetchProductDetails { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let productDetails):
                self.productDetails = productDetails
                self.productImages = productDetails.images
                self.productColors = productDetails.color
                self.productCapacity = productDetails.capacity
                self.productDetails?.discountPrice = self.discountPrice
                self.reloadData()
            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
        }
    }
}

// MARK: - Set up collection view

extension ProductDetailsViewController {
    
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
}

// MARK: - Create compositional layout

extension ProductDetailsViewController {
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
        return section
    }
    
    private func createProductDetailsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(450))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }
}

// MARK: - Create diffable datasource

extension ProductDetailsViewController {
    private func createDiffableDatasource()  {
        fetchData()
        dataSource = UICollectionViewDiffableDataSource<SectionTypes, AnyHashable>(collectionView: collectionView!, cellProvider: { [weak self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let self = self else {return nil}
            guard let section = SectionTypes(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")}
            switch section {
            case .productImageSection:
                if let productImage = item as? String {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImageCell.identifier, for: indexPath) as! ProductImageCell
                    cell.configure(picture: productImage)
                    return cell
                } else { print("something wrong") ; return nil}
            case .productDetailsSection:
                if let productDetails = item as? ProductDetails {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailsCell.identifier, for: indexPath) as! ProductDetailsCell
                    cell.configure(title: productDetails.title, isFavourites: productDetails.isFavorites, rating: productDetails.rating, cpu: productDetails.cpu, camera: productDetails.camera, ssd: productDetails.ssd, sd: productDetails.sd, price: productDetails.discountPrice ?? productDetails.price)
                    cell.addToCartButton.addTarget(self, action: #selector(self.addToCart), for: .touchUpInside)
                    print("product details cell configured")
                    return cell
                } else { print("something wrong") ; return nil}
            }
        })
    }
    
    private func reloadData() {
        guard let productImages = productImages,
              let productDetails = self.productDetails else {return}
        
        var snapShop = NSDiffableDataSourceSnapshot<SectionTypes, AnyHashable>()
        snapShop.appendSections([.productImageSection, .productDetailsSection])
        snapShop.appendItems(productImages, toSection: .productImageSection)
        snapShop.appendItems([productDetails], toSection: .productDetailsSection)
        dataSource?.apply(snapShop, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewDelegate

extension ProductDetailsViewController: UICollectionViewDelegate {}
