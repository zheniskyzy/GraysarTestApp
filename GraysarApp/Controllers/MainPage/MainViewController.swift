//
//  MainViewController.swift
//  GraysarApp
//
//  Created by Madina Olzhabek on 04.06.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
 
    var languageArray: [Language] = [Language(name: "Spanish", image: "Spanish", price: "100$", added: false), Language(name: "Korean", image: "Korean", price: "89$", added: false), Language(name: "Japanese", image: "Japanese", price: "200$", added: false), Language(name: "English", image: "English", price: "150$", added: false) ]
    
//    var basketArray: [CartItem] = []
    
//    MARK: - UI elements
    
    var titleLabel: UILabel = {
       var label = UILabel()
        label.text = "Курсы"
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
   lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical
       layout.minimumLineSpacing = 15
       layout.minimumInteritemSpacing = 2
       layout.estimatedItemSize.width = 300
       layout.estimatedItemSize.height = 180

    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
       collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        do{
//            if let data = UserDefaults.standard.data(forKey: "Basket"){
//                let array = try JSONDecoder().decode([CartItem].self, from: data)
//                 basketArray = array
//                
//            }
//            
//        }catch{
//            print("unbleto to encode \(error)")
//        }
//            collectionView.reloadData()
//    }
   
//    MARK: - collectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCollectionViewCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(resource: ColorResource.lightBlue).cgColor
        cell.layer.cornerRadius = 8
        cell.setData(array: languageArray[indexPath.row])
        
//        for i in basketArray {
//            if languageArray[indexPath.row].name == i.name {
//                cell.added = i.isSelected
//            }
//        }
        
        return cell
    }
}

extension MainViewController {
//    MARK: - setups
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
       
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.equalToSuperview().inset(24)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
    }
}
