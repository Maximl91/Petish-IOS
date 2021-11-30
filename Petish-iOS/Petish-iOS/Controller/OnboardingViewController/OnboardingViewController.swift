import UIKit
import Firebase
import FBSDKLoginKit

class OnboardingViewController: BaseViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionPaging: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView?.configureBackButton(title: "BACK", hidden: true)
    
        configureCollectionView()
        currentPagingView(index: 0)
        collectionPaging.numberOfPages = onboardingData.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser?.uid != nil {
            self.performSegue(withIdentifier: SegueIdentifiers.AlreadyLoggedIn , sender: self)
        }
        
        if let token = AccessToken.current, !token.isExpired {
            self.performSegue(withIdentifier: SegueIdentifiers.AlreadyLoggedIn , sender: self)
        }
    }
    
    override func rightAction() {
        self.performSegue(withIdentifier: SegueIdentifiers.SkipToLogin , sender: self)
    }
    
    func currentPagingView(index: Int){
        descriptionLabel?.text = onboardingData[index].descriptionTexts
        subtitleLabel?.text = onboardingData[index].subtitleTexts
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
        return onboardingData.count // 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photoCellReuseId, for: indexPath) as! PhotoCell
        cell.initCell(image: onboardingData[indexPath.row].image)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let centerOffset = 0.70
        let index = (scrollView.contentOffset.x / scrollView.frame.width )+centerOffset
        let roundedIndex = round(index)
        let indexInBounds = Int(roundedIndex)%onboardingData.count
        // once scrolled update outlets
        currentPagingView(index: index<1 ? 0 : indexInBounds )
    }
}
