//
//  ViewController.swift
//  CollectionViewApp
//
//  Created by Nikolay Pochekuev on 25.04.2024.
//

import UIKit

class ViewController: UIViewController {

    let cellWidth = (3/4) * UIScreen.main.bounds.width
    let spacing = (1/16) * UIScreen.main.bounds.width
    let cellSpacing = (1/16) * UIScreen.main.bounds.width

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.sectionInset = .init(top: 0, left: self.spacing, bottom: 0, right: self.spacing)
        layout.minimumLineSpacing = self.cellSpacing
        layout.itemSize = .init(width: self.cellWidth, height: self.view.frame.height / 2)
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(CollectionCell.self,
                                forCellWithReuseIdentifier: "\(CollectionCell.self)")
        return collectionView
    }()
}

private extension ViewController {
    func setup() {
        self.view.addSubview(collectionView)
        makeConstraints()
    }
    
    func makeConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionCell.self)", for: indexPath) as! CollectionCell
        return cell
    }
}

class CollectionCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 8
        return view
    }()
}

private extension CollectionCell {
    func setup() {
        self.contentView.addSubview(containerView)
        makeConstraints()
    }
    
    func makeConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor,
                                               constant: 0),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
                                                   constant: 0),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,
                                                    constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,
                                                  constant: 0)
        ])
    }
}
