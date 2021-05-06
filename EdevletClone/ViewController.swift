//
//  ViewController.swift
//  EdevletClone
//
//  Created by Kerim Caglar on 6.05.2021.
//

import UIKit

class ViewController: UIViewController {

    let sections = Bundle.main.decode([Section].self, from: "edevlet.json")
    var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, EDevlet>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        //TODO: Celller burda register edilecek
        //SeactionHeader TODO
        collectionView.register(HighlightCell.self, forCellWithReuseIdentifier: HighlightCell.reusableIdentifier)
        collectionView.register(TopCell.self, forCellWithReuseIdentifier: TopCell.reusableIdentifier)
        collectionView.register(BottomCell.self, forCellWithReuseIdentifier: BottomCell.reusableIdentifier)
        
        createDataSource()
        reloadData()
    }

    func configure<T: EDevletCell>(cellType: T.Type, with edevlet: EDevlet, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Error")
        }
        
        cell.configure(with: edevlet)
        
        return cell
    }
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, EDevlet>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, edevlet)  in
            
            switch self.sections[indexPath.section].type {
            case "top":
                return self.configure(cellType: TopCell.self, with: edevlet, for: indexPath)
            case "bottom":
                return self.configure(cellType: BottomCell.self, with: edevlet, for: indexPath)
            default:
                return self.configure(cellType: HighlightCell.self, with: edevlet, for: indexPath)
            }
        })
        
        //???
    }
    
    //TODO: DEĞİŞİKLİK OLACAK
    func createCompositionalLayout() -> UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            
            let section = self.sections[sectionIndex]
            
            switch section.type {
            case "top":
                return self.createTopSection()
            case "bottom":
                return self.createBottomSection()
            default:
                return self.createHighLightedSection()
            }
            
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 15
        layout.configuration = config
        
        return layout
    }
    
    func reloadData() {
       
        var snapshot = NSDiffableDataSourceSnapshot<Section, EDevlet>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
    
    func createTopSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.33))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.66), heightDimension: .estimated(240))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        //Section Header???
         return layoutSection
    }
    
    func createBottomSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalHeight(0.5))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        //Section Header???
         return layoutSection
    }
    
    func createHighLightedSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .fractionalWidth(0.5))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        //Section Header???
         return layoutSection
    }
    
    //Section Header
    func createSectionHeader() {
        
    }
}

