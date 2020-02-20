//
//  ProgressIndicator.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 20/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

class ProgressIndicator: UIVisualEffectView {
    var text: String? {
        didSet {
            
        }
    }
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let label = UILabel()
    let blurEffect = UIBlurEffect(style: .dark)
    let vibrancyView: UIVisualEffectView
    
    init(text: String) {
        self.text = text
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(effect: blurEffect)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        self.text = ""
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(coder: coder)
        self.setup()
    }
    
    func setup() {
        self.contentView.addSubview(vibrancyView)
        self.contentView.addSubview(activityIndicator)
        self.contentView.addSubview(label)
        activityIndicator.startAnimating()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            let width = superview.frame.size.width / 1.8
            let height: CGFloat = 70
            self.frame = CGRect(x: superview.frame.size.width / 2 - width / 2,
                                y: superview.frame.size.height / 2 - height / 2,
                                width: width,
                                height: height)
            
            vibrancyView.frame = self.bounds
            
            let activityIndicatorSize: CGFloat = 40
            activityIndicator.frame = CGRect(x: DEFAULT_BORDER_SPACE,
                                             y: height / 2 - activityIndicatorSize / 2,
                                             width: activityIndicatorSize,
                                             height: activityIndicatorSize)
            
            self.layer.cornerRadius = 8
            self.layer.masksToBounds = true
            
            label.text = text
            label.textAlignment = .center
            label.frame = CGRect(x: activityIndicatorSize + DEFAULT_COMPONENT_SPACE,
                                 y: 0,
                                 width: width - activityIndicatorSize - DEFAULT_BORDER_SPACE,
                                 height: height)
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}
