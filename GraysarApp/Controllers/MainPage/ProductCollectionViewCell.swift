//
//  ProductCollectionViewCell.swift
//  GraysarApp
//
//  Created by Madina Olzhabek on 05.06.2024.
//

import UIKit



class ProductCollectionViewCell: UICollectionViewCell {
    
    var added = false
    
    var imageView: UIImageView = {
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
    
    var addButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = UIColor(resource: ColorResource.blueHeart)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(addToBasket) , for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addButton)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(array: Language) {
        self.imageView.image = UIImage(named: array.image)
        self.nameLabel.text = array.name
        self.priceLabel.text = array.price
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(8)
            make.height.equalTo(110)
            make.width.equalTo(150)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-8)
            make.horizontalEdges.equalToSuperview().inset(12)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-8)
            make.horizontalEdges.equalToSuperview().inset(12)
        }
        addButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.top.equalTo(imageView.snp.bottom).inset(-2)
            make.right.equalToSuperview().inset(8)
        }
    }
    @objc func addToBasket(){
        added.toggle()
        
        let newElement = CartItem(name: self.nameLabel.text ?? "", price: self.priceLabel.text ?? "" , image: self.nameLabel.text ?? "")
      
        
        if added {
            addButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)

            do{
                if let data = UserDefaults.standard.data(forKey: "Basket"){
                    var array = try JSONDecoder().decode([CartItem].self, from: data)
                    array.append(newElement)
                    let encodedata = try JSONEncoder().encode(array)
                    UserDefaults.standard.set(encodedata, forKey: "Basket")
                }else{
                    let encodedata = try JSONEncoder().encode([newElement])
                    UserDefaults.standard.set(encodedata, forKey: "Basket")
                }
                
            }catch{
                print("unbleto to encode \(error)")
            }
          
        }else {
            addButton.setImage(UIImage(systemName: "heart"), for: .normal)
            
        }
       
        
    }
    
}
