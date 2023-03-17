//
//  GistListViewController.swift
//  Gister
//
//  Created by Вячеслав Грудкин on 16.03.2023.
//

import UIKit

protocol GistListViewControllerInput: AnyObject {

    var output: GistListViewControllerOutput? { get set }

}

protocol GistListViewControllerOutput: AnyObject {

    func viewDidLoad()

}

final class GistListViewController: UIViewController {

    var output: GistListViewControllerOutput?

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewLayout())
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        output?.viewDidLoad()
    }

}

// MARK: - Setup

private extension GistListViewController {

    func setup() {
        addSubviews()
        constraintSubviews()
        setupNavigationBar()
        view.backgroundColor = .systemBackground
    }

    func addSubviews() {
        view.addSubview(collectionView)
    }

    func constraintSubviews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Gist"
    }

}

extension GistListViewController: GistListViewControllerInput {

}
