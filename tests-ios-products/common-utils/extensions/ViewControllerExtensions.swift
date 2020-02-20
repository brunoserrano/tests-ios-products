//
//  ViewControllerExtensions.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 20/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

extension UIViewController {
    func showProgressIndicator(view:UIView){
        
        view.isUserInteractionEnabled = false
        
        // Create and add the view to the screen.
        let progressIndicator = ProgressIndicator(text: "Please wait..")
        progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
        view.addSubview(progressIndicator)
        
    }

    /* Hide progress Indicator */
    func hideProgressIndicator(view:UIView){
        
        view.isUserInteractionEnabled = true
        
        if let viewWithTag = view.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
            viewWithTag.removeFromSuperview()
        }
        
    }
}
