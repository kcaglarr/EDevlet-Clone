//
//  BottomCell.swift
//  EdevletClone
//
//  Created by Kerim Caglar on 6.05.2021.
//

import UIKit

class BottomCell: UICollectionViewCell, EDevletCell {
    
    static var reusableIdentifier: String = "BottomCell"
    
    let imageView = UIImageView()
    let title = UILabel()
    let subTitle = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        title.font = UIFont.preferredFont(forTextStyle: .subheadline)
        title.textColor = .label
        title.numberOfLines = 0
        
        subTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        subTitle.textColor = .label
        subTitle.numberOfLines = 0
        
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let innerStackView =  UIStackView(arrangedSubviews: [title, subTitle])
        innerStackView.axis = .vertical
        
        let outerStackView = UIStackView(arrangedSubviews: [imageView, innerStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.alignment = .center
        outerStackView.spacing = 10
        contentView.addSubview(outerStackView)
        
        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with edevlet: EDevlet?) {
        title.text = edevlet?.name
        subTitle.text = edevlet?.subheading
        imageView.image = UIImage(named: edevlet?.image ?? "")
    }
    
    
}
