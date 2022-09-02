//
//  CartViewController.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 02.09.2022.
//

import Foundation
import UIKit

class CartViewController: UIViewController {
    private var collectionView: UICollectionView?
    enum SectionTypes: Int, CaseIterable, Hashable {
        case product
        case cost
        case checOut
    }
    var dataSource: UICollectionViewDiffableDataSource<SectionTypes, AnyHashable>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .defaultBackgroundColor()
        setUpNavigationView()
        setUpMyCartLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

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
        if navigationController?.viewControllers.last is CartViewController {
        navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
            
        }
    }
    private func setUpMyCartLabel() {
      let myCartLabel = UILabel()
        view.addSubview(myCartLabel)
        myCartLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        myCartLabel.font = UIFont(name: "MarkPro-Bold", size: 35)
        myCartLabel.textAlignment = .left
        myCartLabel.attributedText = NSMutableAttributedString(string: "My Cart", attributes: [NSAttributedString.Key.kern: -0.33])
        
        myCartLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCartLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 166),
            myCartLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            myCartLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
        ])
    }
}
