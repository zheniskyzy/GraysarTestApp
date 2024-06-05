//
//  ProducInBasketTableViewCell.swift
//  GraysarApp
//
//  Created by Madina Olzhabek on 05.06.2024.
//

import UIKit

class ProducInBasketTableViewCell: UITableViewCell {
    
    var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(80)
            make.left.equalToSuperview().inset(24)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.equalTo(image.snp.right).inset(-8)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-5)
            make.left.equalTo(image.snp.right).inset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(array: CartItem) {
        self.image.image = UIImage(named: array.image)
        self.nameLabel.text = array.name
        self.priceLabel.text = array.price
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

