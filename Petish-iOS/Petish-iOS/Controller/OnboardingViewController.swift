import UIKit

class OnboardingViewController: UIViewController {
    
    private var sections = [#imageLiteral(resourceName: "Rectangle 2.2"), #imageLiteral(resourceName: "Rectangle 2.2-2"), #imageLiteral(resourceName: "Rectangle 2.2-1")]
    private let viewModel = OnboardingViewModel()
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionPaging: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        currentPagingView(index: 0)
    }
    
    func currentPagingView(index: Int){
        descriptionLabel?.text = viewModel.descriptionTexts[index]
        subtitleLabel?.text = viewModel.subtitleTexts[index]
        collectionPaging?.currentPage = index
    }
    
    func configureCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = ZoomAndSnapFlowLayout()
        registerCollectionCells()
    }
}

// MARK: - UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func registerCollectionCells(){
        collectionView.register(UINib(nibName: Constants.photoCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.photoCellReuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photoCellReuseId, for: indexPath) as! PhotoCell
            cell.initCell(image: sections[indexPath.row])
            return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                let width = scrollView.frame.width - (scrollView.contentInset.left*2)
                let index = scrollView.contentOffset.x / width
                let roundedIndex = round(index)
                // once scrolled update outlets
                currentPagingView(index: Int(roundedIndex))
            }
}

