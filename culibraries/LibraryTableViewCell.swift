//
//  LibraryTableViewCell.swift
//  culibraries
//
//  Created by Gabriel Godoy on 11/27/22.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    let libraryImageView = UIImageView()
    let libName = UILabel()
    let ratingLabel = UILabel()
    let addressLabel = UILabel()
    let rateL = UILabel()
    let star = UILabel()
    
    var starred : Bool = false

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        star.text = ""
        star.textColor = .systemYellow
        star.translatesAutoresizingMaskIntoConstraints  = false
        contentView.addSubview(star)
        
        libraryImageView.translatesAutoresizingMaskIntoConstraints  = false
        contentView.addSubview(libraryImageView)
        
        libName.font = .systemFont(ofSize: 20, weight: .bold)
        libName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(libName)
        
        rateL.font = .systemFont(ofSize: 17, weight: .bold)
        rateL.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rateL)
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ratingLabel)
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addressLabel)
        
        
        setUpConstraints()
    }
    func configure(lib: Library){
        if lib.star {star.text = "★"}
        starred = lib.star
        libraryImageView.image = UIImage(named: lib.picture)
        libName.text = lib.name
        rateL.text = lib.rateL
        ratingLabel.text = lib.rate
        addressLabel.text = lib.addressLabel
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            libraryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            libraryImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.33),
            libraryImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.33),
            libraryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            libraryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            libName.leadingAnchor.constraint(equalTo: libraryImageView.trailingAnchor,constant: 10),
            libName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            rateL.leadingAnchor.constraint(equalTo: libraryImageView.trailingAnchor,constant: 10),
            rateL.topAnchor.constraint(equalTo: libName.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: libraryImageView.trailingAnchor,constant: 55),
            ratingLabel.topAnchor.constraint(equalTo: libName.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            addressLabel.leadingAnchor.constraint(equalTo: libraryImageView.trailingAnchor,constant: 10),
            addressLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            star.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            star.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LibraryTableViewCell: ChangeLibraryDelegate {
    func changeLibraryRate(rate: String) {
        ratingLabel.text = rate
    }
}
