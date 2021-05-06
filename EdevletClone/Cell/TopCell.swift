//
//  TopCell.swift
//  EdevletClone
//
//  Created by Kerim Caglar on 6.05.2021.
//

import UIKit

class TopCell: UICollectionViewCell, EDevletCell {
    
    static var reusableIdentifier: String = "TopCell"
    
    //TODO: seperator
    let imageView = UIImageView()
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.textColor = .label
        
        let stackView = UIStackView(arrangedSubviews: [imageView, title])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.spacing = 10
        contentView.addSubview(stackView)
        
        //AUTOLAYOUT
        NSLayoutConstraint.activate([
        
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with edevlet: EDevlet?) {
        title.text = edevlet?.name ?? "-"
        imageView.image = UIImage(named: edevlet?.image ?? "")
    }
    
}
