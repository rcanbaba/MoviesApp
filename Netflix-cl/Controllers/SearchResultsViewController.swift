//
//  SearchResultsViewController.swift
//  Netflix-cl
//
//  Created by Can Babaoğlu on 15.05.2022.
//

import UIKit

protocol SearchResultsViewControllerDelegate: AnyObject {
    func didTapCell(_ viewModel: TitlePreviewViewModel)
}

class SearchResultsViewController: UIViewController {
    
    public var titles: [Title] = [Title]()
    
    public weak var delegate: SearchResultsViewControllerDelegate?
    
    public lazy var searchResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(searchResultsCollectionView)
        
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        searchResultsCollectionView.frame = view.bounds
    }

}

extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }

        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        let titleName = (title.original_title ?? "") + " movie"
        API.shared.searchOnYoutube(with: titleName) { [weak self] result in
            switch result {
            case .success(let videoItem):
                self?.delegate?.didTapCell(TitlePreviewViewModel(title: title.original_title ?? "", youtubeView: videoItem, titleOverview: title.overview ?? ""))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
