//
//  SuccessViewController.swift
//  GraysarApp
//
//  Created by Madina Olzhabek on 05.06.2024.
//

import UIKit

class SuccessViewController: UIViewController {
    
    var titleLabel: UILabel = {
       var label = UILabel()
        label.text = "Оплата прошла успешно"
        label.numberOfLines = 2
        label.textColor = .green
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(12)
        }
        
    }
    


}
