import UIKit
import Firebase
import FBSDKLoginKit

class OnboardingViewController: UIViewController {
    private let images = OnboardingData.images
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionPaging: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        currentPagingView(index: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
  
        if Auth.auth().currentUser?.uid != nil {
            self.performSegue(withIdentifier: SegueIdentifiers.AlreadyLoggedIn , sender: self)
        }
        
        if let token = AccessToken.current, !token.isExpired { // doesnt work!
            self.performSegue(withIdentifier: SegueIdentifiers.AlreadyLoggedIn , sender: self)
        }
    }

    func currentPagingView(index: Int){
        descriptionLabel?.text = OnboardingData.descriptionTexts[index]
        subtitleLabel?.text = OnboardingData.subtitleTexts[index]
        collectionPaging?.currentPage = index
    }
    
    func configureCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = ZoomAndSnapFlowLayout()
        collectionView.isPagingEnabled = false
        registerCollectionCells()
    }
}
// MARK: - UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func registerCollectionCells(){
        collectionView.register(UINib(nibName: Constants.photoCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.photoCellReuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return images.count // 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photoCellReuseId, for: indexPath) as! PhotoCell
        cell.initCell(image: images[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let centerOffset = 0.3
        let index = (scrollView.contentOffset.x / scrollView.frame.width )+centerOffset
        let roundedIndex = round(index)
        let indexInBounds = Int(roundedIndex)%images.count
        // once scrolled update outlets
        currentPagingView(index: indexInBounds)
    }
}
