//
//  RestaurantTypeCell.swift
//  GeoFood
//
//  Created by Егор on 26.04.2021.
//

import UIKit

class RestaurantTypeCell: UICollectionViewCell {
    
    private let textLabel = UILabel()
    private let image = UIImageView()
    var selectionMode = false
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    private func setupUI() {
        textLabel.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        textLabel.textColor = UIColor(named: "dark_blue")
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = UIColor(named: "dark_blue")
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.borderColor = UIColor(named: "light_green")!.cgColor
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = contentView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(blurEffectView)
        backgroundColor = UIColor(named: "lime")
        
        contentView.addSubview(textLabel)
        contentView.addSubview(image)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
        
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 20),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            textLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5),
            textLabel.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            textLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5)
            
        ])
    }
    
    func configure(with type: RestaurantType) {
        textLabel.text = type.text
        image.image = type.image
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
