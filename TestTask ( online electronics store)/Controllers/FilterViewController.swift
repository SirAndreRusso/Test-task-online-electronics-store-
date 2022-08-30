//
//  FilterViewController.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 29.08.2022.
//

import UIKit

class FilterViewController: UIViewController {

    lazy var titleLabel: UILabel = {
         let label = UILabel()
        label.attributedText = NSMutableAttributedString(string: "Filter options", attributes: [NSAttributedString.Key.kern: -0.33])
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textAlignment = .center
        return label
        
     }()
     
 //TODO: - Set Up constraints
    
    lazy var closeButton: UIButton = {
       let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "CloseButton"), for: .normal)
//        closeButton.addTarget(self, action: #selector(handleCloseAction), for: .touchUpInside)
        return closeButton
    }()
    
    lazy var doneButton: UIButton = {
       let doneButton = UIButton()
        doneButton.setImage(UIImage(named: "DoneButton"), for: .normal)
//        doneButton.addTarget(self, action: #selector(handleCloseAction), for: .touchUpInside)
        return doneButton
    }()
    
    lazy var brandLabel: UILabel = {
        let brandLabel = UILabel()
        brandLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        brandLabel.font = UIFont(name: "MarkPro-Medium", size: 18)
        brandLabel.numberOfLines = 0
        brandLabel.text = "Brand"
        
        return brandLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        priceLabel.font = UIFont(name: "MarkPro-Medium", size: 18)
        priceLabel.numberOfLines = 0
        priceLabel.text = "Price"
        
        return priceLabel
    }()
    lazy var sizeLabel: UILabel = {
        let sizeLabel = UILabel()
        sizeLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        sizeLabel.font = UIFont(name: "MarkPro-Medium", size: 18)
        sizeLabel.numberOfLines = 0
        sizeLabel.text = "Size"
        
        return sizeLabel
    }()
    
    lazy var brandButton: DropDownButton = {
       let brandButton = DropDownButton(stringTitle: "Samsung")
        return brandButton
    }()
    
    lazy var priceButton: DropDownButton = {
       let priceButton = DropDownButton(stringTitle: "$0 - $10000")
        return priceButton
    }()
    
    lazy var sizeButton: DropDownButton = {
       let sizeButton = DropDownButton(stringTitle: "4.5 to 5.5 inches")
        return sizeButton
    }()
    
    
     lazy var containerView: UIView = {
         let view = UIView()
         view.backgroundColor = .white
         view.layer.cornerRadius = 16
         view.clipsToBounds = true
         return view
     }()
     
     let maxDimmedAlpha: CGFloat = 0.6
     lazy var dimmedView: UIView = {
         let view = UIView()
         view.backgroundColor = .black
         view.alpha = maxDimmedAlpha
         return view
     }()
     
     // Constants
     let defaultHeight: CGFloat = 375
     let dismissibleHeight: CGFloat = 275
     let maximumContainerHeight: CGFloat = 400
     // keep current new height, initial is default height
     var currentContainerHeight: CGFloat = 300
     
     // Dynamic container constraint
     var containerViewHeightConstraint: NSLayoutConstraint?
     var containerViewBottomConstraint: NSLayoutConstraint?
     
     override func viewDidLoad() {
         super.viewDidLoad()
         setupView()
         setupConstraints()
         // tap gesture on dimmed view to dismiss
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseAction))
         dimmedView.addGestureRecognizer(tapGesture)
         
         setupPanGesture()
     }
     
     @objc func handleCloseAction() {
         animateDismissView()
     }
     
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         animateShowDimmedView()
         animatePresentContainer()
     }
     
     func setupView() {
         view.backgroundColor = .clear
     }
     
     func setupConstraints() {
         
         view.addSubview(dimmedView)
         view.addSubview(containerView)
         dimmedView.translatesAutoresizingMaskIntoConstraints = false
         containerView.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(closeButton)
         closeButton.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(doneButton)
         doneButton.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(titleLabel)
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(brandLabel)
         brandLabel.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(brandButton)
         brandButton.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(priceLabel)
         priceLabel.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(priceButton)
         priceButton.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(sizeLabel)
         sizeLabel.translatesAutoresizingMaskIntoConstraints = false
         containerView.addSubview(sizeButton)
         sizeButton.translatesAutoresizingMaskIntoConstraints = false
         
         // Set static constraints
         NSLayoutConstraint.activate([
            doneButton.heightAnchor.constraint(equalToConstant: 37),
            doneButton.widthAnchor.constraint(equalToConstant: 86),
            doneButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            doneButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            closeButton.heightAnchor.constraint(equalToConstant: 37),
            closeButton.widthAnchor.constraint(equalToConstant: 37),
            closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            closeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 23),
            titleLabel.widthAnchor.constraint(equalToConstant: 114),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 31),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            brandLabel.heightAnchor.constraint(equalToConstant: 20),
            brandLabel.widthAnchor.constraint(equalToConstant: 57),
            brandLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 103),
            brandLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            brandButton.heightAnchor.constraint(equalToConstant:37),
            brandButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 133),
            brandButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            brandButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            priceLabel.widthAnchor.constraint(equalToConstant: 57),
            priceLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 183),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            priceButton.heightAnchor.constraint(equalToConstant:37),
            priceButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 212),
            priceButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            priceButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            sizeLabel.heightAnchor.constraint(equalToConstant: 20),
            sizeLabel.widthAnchor.constraint(equalToConstant: 57),
            sizeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 263),
            sizeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            sizeButton.heightAnchor.constraint(equalToConstant:37),
            sizeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 294),
            sizeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            sizeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            
            
             // set dimmedView edges to superview
             dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
             dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             // set container static constraint (trailing & leading)
             containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
             // content stackView
             
         ])
         
         // Set dynamic constraints
         // First, set container to default height
         // after panning, the height can expand
         containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
         
         // By setting the height to default height, the container will be hide below the bottom anchor view
         // Later, will bring it up by set it to 0
         // set the constant to default height to bring it down again
         containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
         // Activate constraints
         containerViewHeightConstraint?.isActive = true
         containerViewBottomConstraint?.isActive = true
     }
     
     func setupPanGesture() {
         // add pan gesture recognizer to the view controller's view (the whole screen)
         let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
         // change to false to immediately listen on gesture movement
         panGesture.delaysTouchesBegan = false
         panGesture.delaysTouchesEnded = false
         view.addGestureRecognizer(panGesture)
     }
     
     // MARK: Pan gesture handler
     @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
         let translation = gesture.translation(in: view)
         // Drag to top will be minus value and vice versa
         print("Pan gesture y offset: \(translation.y)")
         
         // Get drag direction
         let isDraggingDown = translation.y > 0
         print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")
         
         // New height is based on value of dragging plus current container height
         let newHeight = currentContainerHeight - translation.y
         
         // Handle based on gesture state
         switch gesture.state {
         case .changed:
             // This state will occur when user is dragging
             if newHeight < maximumContainerHeight {
                 // Keep updating the height constraint
                 containerViewHeightConstraint?.constant = newHeight
                 // refresh layout
                 view.layoutIfNeeded()
             }
         case .ended:
             // This happens when user stop drag,
             // so we will get the last height of container
             
             // Condition 1: If new height is below min, dismiss controller
             if newHeight < dismissibleHeight {
                 self.animateDismissView()
             }
             else if newHeight < defaultHeight {
                 // Condition 2: If new height is below default, animate back to default
                 animateContainerHeight(defaultHeight)
             }
             else if newHeight < maximumContainerHeight && isDraggingDown {
                 // Condition 3: If new height is below max and going down, set to default height
                 animateContainerHeight(defaultHeight)
             }
             else if newHeight > defaultHeight && !isDraggingDown {
                 // Condition 4: If new height is below max and going up, set to max height at top
                 animateContainerHeight(maximumContainerHeight)
             }
         default:
             break
         }
     }
     
     func animateContainerHeight(_ height: CGFloat) {
         UIView.animate(withDuration: 0.4) {
             // Update container height
             self.containerViewHeightConstraint?.constant = height
             // Call this to trigger refresh constraint
             self.view.layoutIfNeeded()
         }
         // Save current height
         currentContainerHeight = height
     }
     
     // MARK: Present and dismiss animation
     func animatePresentContainer() {
         // update bottom constraint in animation block
         UIView.animate(withDuration: 0.3) {
             self.containerViewBottomConstraint?.constant = 0
             // call this to trigger refresh constraint
             self.view.layoutIfNeeded()
         }
     }
     
     func animateShowDimmedView() {
         dimmedView.alpha = 0
         UIView.animate(withDuration: 0.4) {
             self.dimmedView.alpha = self.maxDimmedAlpha
         }
     }
     
     func animateDismissView() {
         // hide blur view
         dimmedView.alpha = maxDimmedAlpha
         UIView.animate(withDuration: 0.4) {
             self.dimmedView.alpha = 0
         } completion: { _ in
             // once done, dismiss without animation
             self.dismiss(animated: false)
         }
         // hide main view by updating bottom constraint in animation block
         UIView.animate(withDuration: 0.3) {
             self.containerViewBottomConstraint?.constant = self.defaultHeight
             // call this to trigger refresh constraint
             self.view.layoutIfNeeded()
         }
     }
 }
