//
//  ViewController.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 22.08.2022.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    var categories: [Category] = []
    var hotSales: [HotSales] = []
    var bestSeller: [BestSeller] = []
    enum SectionTypes: Int, CaseIterable, Hashable {
        case categories
        case hotSales
        case bestSeller
        func description() -> String {
            switch self {
            case .categories:
                return "Category"
            case .hotSales:
                return "HotSales"
            case .bestSeller:
                return "BestSeller"
            }
        }
            
    }
    var dataSource: UICollectionViewDiffableDataSource<SectionTypes, AnyHashable>?
    
    private var categoryCollectionView: UICollectionView?
  
    
// MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        view.backgroundColor = .defaultBackgroundColor()
        fetchData()
        setUpCollectionView()
        createDiffableDatasource()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.reloadData()
        }
    }
// MARK: - fetchData()
    
    private func fetchData() {
        NetworkManager.shared.fetchCategories { [weak self] result in
            guard let self = self else {return}
            switch result {
                
            case .success(let categories):
                self.categories = categories
                print("categories count: \(categories.count)")
            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
            
        }
        NetworkManager.shared.fetchHotSales { [weak self] result in
            guard let self = self else {return}
            switch result {

            case .success(let hotSales):
                self.hotSales = hotSales
                print("hotSales count: \(hotSales.count)")

            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
        }
        
        
        NetworkManager.shared.fetchBestSeller { [weak self] result in
            guard let self = self else {return}
            switch result {
                
            case .success(let bestSeller):
                self.bestSeller = bestSeller
                print("bestSellers count: \(bestSeller.count)")
                
            case .failure(let error):
                self.showAlert(with: "Ошибка!", and: error.localizedDescription)
            }
        }
    }
    
    private func setUpCollectionView() {
        let layout = createCompositionalLayout()
        categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        categoryCollectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        categoryCollectionView?.register(BestSellerCell.self, forCellWithReuseIdentifier: BestSellerCell.identifier)
        categoryCollectionView?.register(HotSalesCell.self, forCellWithReuseIdentifier: HotSalesCell.identifier)
        categoryCollectionView?.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        categoryCollectionView?.showsHorizontalScrollIndicator = false
        categoryCollectionView?.delegate = self
        categoryCollectionView?.backgroundColor = .defaultBackgroundColor()
        guard let collection = categoryCollectionView else { return }
        view.addSubview(collection)

        collection.translatesAutoresizingMaskIntoConstraints = false

        collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 101).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    private func reloadData() {
        var snapShop = NSDiffableDataSourceSnapshot<SectionTypes, AnyHashable>()
        snapShop.appendSections([.categories, .hotSales, .bestSeller])
        snapShop.appendItems(categories, toSection: .categories)
        snapShop.appendItems(hotSales, toSection: .hotSales)
        snapShop.appendItems(bestSeller, toSection: .bestSeller)
        dataSource?.apply(snapShop, animatingDifferences: true)
    }
    
}

extension MainViewController {
    private func createDiffableDatasource()  {
        dataSource = UICollectionViewDiffableDataSource<SectionTypes, AnyHashable>(collectionView: categoryCollectionView!, cellProvider: {  (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let section = SectionTypes(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")}
                switch section {
                case .categories:
                    if let categories = item as? Category {
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
                        cell.configure(category: categories.category, imageForNormal: categories.imageForNormal, imageForPressed: categories.imageForPressed)
                        return cell
                    } else {return nil}
                case .hotSales:
                    if let hotSales = item as? HotSales {
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCell.identifier, for: indexPath) as! HotSalesCell
                        cell.configure(isNew: hotSales.isNew, title: hotSales.title, subtitle: hotSales.subtitle, picture: hotSales.picture, isBuy: hotSales.isBuy)
                        return cell
                    } else {return nil}
                case .bestSeller:
                    if let bestSeller = item as? BestSeller {
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCell.identifier, for: indexPath) as! BestSellerCell
                        cell.configure(isFavourites: bestSeller.isFavorites, title: bestSeller.title, priceWithoutDiscount: bestSeller.priceWithoutDiscount, discountPrice: bestSeller.discountPrice, picture: bestSeller.picture)
                        return cell
                    } else {return nil}
                }
            
        })
        

        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader
            else {fatalError("Can not create new section header")}
            guard let section = SectionTypes(rawValue: indexPath.section)
            else {fatalError("Unknown section kind")}
            switch section {
            case .categories:
                sectionHeader.configure(titleLabel: "Select Category", buttonTitle: "view all")
                return sectionHeader
            case .hotSales:
                sectionHeader.configure(titleLabel: "Hot Sales", buttonTitle: "see more")
                return sectionHeader
            case .bestSeller:
                sectionHeader.configure(titleLabel: "Best Seller", buttonTitle: "see more")
                return sectionHeader
            }
            
            
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.hideImageView()
            cell.categoryLabel.textColor = .specialOrange()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.showImageView()
            cell.categoryLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        }
    }
    
}


extension MainViewController {
    
}

extension MainViewController {
    private func createCompositionalLayout()-> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout {sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            guard let section = SectionTypes(rawValue: sectionIndex) else { fatalError("Unknown section")}
            switch section {
            case .categories:
                return self.createCategory()
            case .hotSales:
                return self.createHotSales()
            case .bestSeller:
                return self.createBestSeller()
            }
            
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 24
        layout.configuration = config
        return layout
    }
    private func createCategory() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(71), heightDimension: .absolute(93))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let spacing = CGFloat(23)
        let groupWidth = CGFloat((71*categories.count) + (categories.count-1)*23)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .absolute(93))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: categories.count)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    private func createHotSales() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let width = CGFloat(view.bounds.width) - 40
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(182))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = view.bounds.width - width
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .groupPaging
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    private func createBestSeller () -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(181), heightDimension: .absolute(227))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(227))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let spacing = CGFloat(12)
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    private func createSectionHeader() ->NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(32))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.extendsBoundary = true
        
        return sectionHeader
    
}
}
