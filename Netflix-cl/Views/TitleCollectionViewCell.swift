//
//  TitleCollectionViewCell.swift
//  Netflix-cl
//
//  Created by Can Babaoğlu on 15.05.2022.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String?) {
        guard let url = URL(string: APIConstants.imageUrlPrefix + (model ?? "")) else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
