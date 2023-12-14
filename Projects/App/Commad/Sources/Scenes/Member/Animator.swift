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
    static let duration: TimeInterval = 0.35
    
    private let type: PresentationType
    private let firstViewController: MemberListController
    private let secondViewController: MemberDetailController
    private var selectedCellImageViewSnapshot: UIView
    private let cellImageViewRect: CGRect
    private let cellLabelRect: CGRect
    
    init?(type: PresentationType, firstViewController: MemberListController, secondViewController: MemberDetailController, selectedCellImageViewSnapshot: UIView) {
        self.type = type
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
        self.selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        
        guard let window = firstViewController.view.window ?? secondViewController.view.window else { return nil }
        guard let selectedCell = firstViewController.selectedCell else { return nil }
        
        self.cellImageViewRect = selectedCell.imageView.convert(selectedCell.imageView.bounds, to: window)
        self.cellLabelRect = selectedCell.nameLabel.convert(selectedCell.nameLabel.bounds, to: window)
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
        
        
        guard let selectedCell = firstViewController.selectedCell,
              let window = firstViewController.view.window ?? secondViewController.view.window,
              let cellImageSnapshot = selectedCell.imageView.snapshotView(afterScreenUpdates: true),
              let cellLabelSnapshot = selectedCell.nameLabel.snapshotView(afterScreenUpdates: true),
              let controllerImageSnapshot = secondViewController.imageView.snapshotView(afterScreenUpdates: true)
        else {
            transitionContext.completeTransition(true)
            return
        }
        
        let isPresenting = type.isPresenting
        
        let backgroundView: UIView
        let fadeView = UIView(frame: containerView.bounds)
        fadeView.backgroundColor = secondViewController.view.backgroundColor
        
        if isPresenting {
            selectedCellImageViewSnapshot = cellImageSnapshot
            
            backgroundView = UIView(frame: containerView.bounds)
            backgroundView.addSubview(fadeView)
            fadeView.alpha = 0
        } else {
            backgroundView = firstViewController.view.snapshotView(afterScreenUpdates: true) ?? fadeView
            backgroundView.addSubview(fadeView)
        }
        
        toView.alpha = 0
        
        [backgroundView, selectedCellImageViewSnapshot, controllerImageSnapshot, cellLabelSnapshot].forEach { containerView.addSubview($0) }
        
        let controllerImageViewRect = secondViewController.imageView.convert(secondViewController.imageView.bounds, to: window)
        let controllerLabelRect = secondViewController.nameLabel.convert(secondViewController.nameLabel.bounds, to: window)
        
        [selectedCellImageViewSnapshot, controllerImageSnapshot].forEach { snapshot in
            snapshot.frame = isPresenting ? cellImageViewRect : controllerImageViewRect
        }
        
        controllerImageSnapshot.alpha = isPresenting ? 0 : 1
        
        selectedCellImageViewSnapshot.alpha = isPresenting ? 1 : 0
        cellLabelSnapshot.frame = isPresenting ? cellLabelRect : controllerLabelRect
        
        UIView.animateKeyframes(withDuration: Self.duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.selectedCellImageViewSnapshot.frame = isPresenting ? controllerImageViewRect : self.cellImageViewRect
                controllerImageSnapshot.frame = isPresenting ? controllerImageViewRect : self.cellImageViewRect
                cellLabelSnapshot.frame = isPresenting ? controllerLabelRect : self.cellLabelRect
                fadeView.alpha = isPresenting ? 1 : 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                self.selectedCellImageViewSnapshot.alpha = isPresenting ? 0 : 1
                controllerImageSnapshot.alpha = isPresenting ? 1 : 0
            }
        }, completion:  { _ in
            self.selectedCellImageViewSnapshot.removeFromSuperview()
            controllerImageSnapshot.removeFromSuperview()
            
            backgroundView.removeFromSuperview()
            
            toView.alpha = 1
            
            transitionContext.completeTransition(true)
        })
    }
    
}

enum PresentationType {
    case present
    case dismiss
    
    var isPresenting: Bool {
        return self == .present
    }
}
