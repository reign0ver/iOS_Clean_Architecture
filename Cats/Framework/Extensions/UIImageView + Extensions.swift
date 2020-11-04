//
//  UIImageView + Extensions.swift
//  Cats
//
//  Created by Andres Carrillo on 4/11/20.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageFromURL(
        _ url: String,
        estimatedWidth: Int,
        estimatedHeight: Int,
        cornerRadius: CGFloat? = 0
    ) {
        let url = URL(string: url)
        let scale = UIScreen.main.scale
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: estimatedWidth, height: estimatedHeight)) |> RoundCornerImageProcessor(cornerRadius: cornerRadius!)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .scaleFactor(scale),
                .transition(.fade(1)),
            ])
    }
    
}
