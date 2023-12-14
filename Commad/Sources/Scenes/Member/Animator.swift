//
//  Animator.swift
//  Commad
//
//  Created by 정명곤 on 12/11/23.
//  Copyright © 2023 aodrhs. All rights reserved.
//

import Foundation
import UIKit

final class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    static let duration: TimeInterval = 1.25
    
    private let type: PresentationType
    private let firstViewController: MemberListController
    private let secondViewController: MemberDetailController
    private let selectedCellImageViewSnapshot: UIView
    private let cellImageViewRect: CGRect
    
    init?(type: PresentationType, firstViewController: MemberListController, secondViewController: MemberDetailController, selectedCellImageViewSnapshot: UIView) {
        self.type = type
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
        self.selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        
        guard let window = firstViewController.view.window ?? secondViewController.view.window,
              let selectedCell = firstViewController.selectedCell else { return nil }
        
        self.cellImageViewRect = selectedCell.imageView.convert(selectedCell.imageView.bounds, to: window)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let toView = secondViewController.view else {
            transitionContext.completeTransition(false)
            return
        }
        
        containerView.addSubview(toView)
        
//        transitionContext.completeTransition(true)
        
        guard let selectedCell = firstViewController.selectedCell,
              let window = firstViewController.view.window ?? secondViewController.view.window,
              let cellImageShot = selectedCell.imageView.snapshotView(afterScreenUpdates: true),
              let controllerImageSnapshot = secondViewController.imageView.snapshotView(afterScreenUpdates: true) 
        else {
            transitionContext.completeTransition(true)
            return
        }
        
        let isPresenting = type.isPresenting
        
        let imageViewSnapshot: UIView
        
        if isPresenting {
            imageViewSnapshot = cellImageShot
        } else {
            imageViewSnapshot = controllerImageSnapshot
        }
        
        toView.alpha = 0
        
        [imageViewSnapshot].forEach { containerView.addSubview($0) }
        
        let controllerImageViewRect = secondViewController.imageView.convert(secondViewController.imageView.bounds, to: window)
        
        [imageViewSnapshot].forEach { snapshot in
            snapshot.frame = isPresenting ? cellImageViewRect : controllerImageViewRect
        }
        
        UIView.animateKeyframes(withDuration: Self.duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                imageViewSnapshot.frame = isPresenting ? controllerImageViewRect : self.cellImageViewRect
            }
        }, completion:  { _ in
            imageViewSnapshot.removeFromSuperview()
            toView.alpha = 1
            transitionContext.completeTransition(true)
        })
        
        return
    }
    
}

enum PresentationType {
    case present
    case dismiss
    
    var isPresenting: Bool {
        return self == .present
    }
}
