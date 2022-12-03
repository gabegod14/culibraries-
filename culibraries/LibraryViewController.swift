//
//  LibraryViewController.swift
//  culibraries
//
//  Created by Gabriel Godoy on 11/27/22.
//

import UIKit

class LibraryViewController: UIViewController {
    
    let libraryImageView = UIImageView()
    let libName = UILabel()
    let rateLabel = UILabel()
    let rateTextField = UITextField()
    let submitButton = UIButton()
    var libraryTextView = UITextView()
    let reserveButton = UIButton()
    let star = UIButton()
    let mapImageView = UIImageView()
    
    
    var isSelected : Bool = false
    var isStarred : Bool = false
    var libraryImage: String = ""
    let lib: Library
    var mapImage: UIImage?
    weak var delegate: ChangeLibraryDelegate?
    
    init(lib: Library, delegate: ChangeLibraryDelegate?) {
        self.lib = lib
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NetworkManager.getMap(libraryId: 1) { imageString in
            print(imageString)
            if let data = Data(base64Encoded: imageString, options: .ignoreUnknownCharacters) {
                print(data)
                self.mapImage = UIImage(data: data)
            }
            else {
                print("my bad")
            }
        }
        
        libraryImageView.image = UIImage(named: lib.picture)
        libraryImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(libraryImageView)
        
        libName.text = lib.name
        libName.textColor = .black
        libName.font = .systemFont(ofSize: 20, weight: .bold)
        libName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(libName)
        
        libraryTextView.text = lib.description
        libraryTextView.font = .systemFont(ofSize: 20)
        libraryTextView.translatesAutoresizingMaskIntoConstraints = false
        libraryTextView.isEditable = false
        view.addSubview(libraryTextView)
        
        rateLabel.text = "Rate 1-10"
        rateLabel.textColor = .black
        rateLabel.font = .systemFont(ofSize: 20, weight: .bold)
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rateLabel)
        
        rateTextField.placeholder = "Rate Here"
        rateTextField.font = .systemFont(ofSize: 20)
        rateTextField.backgroundColor = .systemGray3
        rateTextField.layer.cornerRadius = 5
        rateTextField.clipsToBounds = true
        rateTextField.textAlignment = .center
        rateTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rateTextField)
        
        submitButton.setTitle("submit", for: .normal)
        submitButton.setTitleColor(.systemBlue, for: .normal)
        submitButton.addTarget(self, action: #selector(changeLibraryCell), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        
        if lib.star{star.setTitle("★", for: .normal)}
        else {star.setTitle("☆", for: .normal)}
        star.setTitleColor(.systemYellow, for: .normal)
        star.addTarget(self, action: #selector(didStar), for: .touchUpInside)
        star.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(star)
        
        
        reserveButton.setTitle("Reserve a Room", for: .normal)
        reserveButton.setTitleColor(.red, for: .normal)
        reserveButton.layer.borderWidth = 2
        reserveButton.layer.borderColor = UIColor.black.cgColor
        reserveButton.layer.cornerRadius = 20
        reserveButton.addTarget(self, action: #selector(didSelectReserveRoom), for: .touchUpInside)
        reserveButton.translatesAutoresizingMaskIntoConstraints = false
        if lib.canReserve {view.addSubview(reserveButton)}
        
//        mapImageView.image = self.mapImage
//        mapImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(mapImageView)
        
        setupConstraints()
        
    }
    
    @objc func changeLibraryCell(){
        delegate?.changeLibraryRate(rate: rateTextField.text ?? "oops")
        lib.rate = rateTextField.text!
        dismiss(animated: true)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            libraryImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            libraryImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            libraryImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            libraryImageView.heightAnchor.constraint(equalTo:view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            libName.topAnchor.constraint(equalTo: libraryImageView.bottomAnchor, constant: 20),
            libName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            star.centerYAnchor.constraint(equalTo: libName.centerYAnchor),
            star.leadingAnchor.constraint(equalTo: libName.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            libraryTextView.topAnchor.constraint(equalTo: libName.bottomAnchor, constant: 30),
            libraryTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            libraryTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            libraryTextView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -10)
        ])
        
        
        NSLayoutConstraint.activate([
            rateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 560),
            rateLabel.centerXAnchor.constraint(equalTo: rateTextField.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            rateTextField.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 10),
            rateTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rateTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.55)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            submitButton.centerXAnchor.constraint(equalTo: rateTextField.centerXAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            mapImageView.topAnchor.constraint(equalTo: libraryTextView.bottomAnchor, constant: -10),
//            mapImageView.leadingAnchor.constraint(equalTo: rateTextField.trailingAnchor, constant : 10)
//        ])
        
        if lib.canReserve{
            NSLayoutConstraint.activate([
                reserveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
                reserveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                reserveButton.widthAnchor.constraint(equalToConstant: 170)
            ])}
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didSelectReserveRoom(){
        if let url = URL(string: lib.link) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }

    }
    
    @objc func didStar(){
        if !isStarred{
            isStarred = true;
            lib.star = true;
            star.setTitle("★", for: .normal)
        }
        else{
            isStarred = false;
            lib.star = false;
            star.setTitle("☆", for: .normal)
        }

    }
}

protocol ChangeLibraryDelegate: UITableViewCell{
    func changeLibraryRate(rate: String)
}
