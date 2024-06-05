//
//  BasketViewController.swift
//  GraysarApp
//
//  Created by Madina Olzhabek on 04.06.2024.
//

import UIKit


class BasketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var basketArray: [CartItem] = []
    
    var titleLabel: UILabel = {
       var label = UILabel()
        label.text = "Корзина"
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(ProducInBasketTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var buyButton: UIButton = {
        var button = UIButton()
        button.setTitle("Оплатить", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.tintColor = .white
        button.addTarget(self, action: #selector(buy), for: .touchUpInside)
        return button
    }()

//    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        print(basketArray.count)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do{
            if let data = UserDefaults.standard.data(forKey: "Basket"){
                let array = try JSONDecoder().decode([CartItem].self, from: data)
                 basketArray = array
            }
            
        }catch{
            print("unbleto to encode \(error)")
        }
            tableView.reloadData()
    }

//    MARK: - TableVIew
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProducInBasketTableViewCell
        
        cell.setData(array: basketArray[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            basketArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveContacts()
        } else if editingStyle == .insert {
           
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return  100
    }

}

extension BasketViewController {
    
//    MARK: - setups
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(buyButton)
      
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.left.equalToSuperview().inset(24)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-50)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(500)
        }
        buyButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(46)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
        }
    }
    
//    MARK: - other func
    
    @objc func buy() {
        let succsessVC = SuccessViewController()
        navigationController?.pushViewController(succsessVC, animated: true)
    }
    
    func saveContacts(){
        let defaults = UserDefaults.standard
        do{
            let encodedata = try JSONEncoder().encode(basketArray )
                defaults.set(encodedata, forKey: "Basket")
            } catch {
                print("unbleto to encode \(error)")
        }
    }
}
