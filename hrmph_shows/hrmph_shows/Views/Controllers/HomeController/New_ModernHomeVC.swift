import UIKit
import iCarousel
import Kingfisher
import RxSwift
import RxCocoa

class NewModernHomeVC: MainTheme {
    
    //let networker = HomeNetworkManager.shared

    var modernVM = ModernViewModel()
    var disposeBag = DisposeBag()
    var new_HomeViewModel: HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeScrollView)
        homeScrollView.addSubview(homeScrollViewContainer)
        homeScrollViewContainer.addArrangedSubview(topBGView)
        homeScrollViewContainer.addArrangedSubview(middleBGView)
        homeScrollViewContainer.addArrangedSubview(bottomBGView)
       
        new_HomeViewModel = HomeViewModel()
        new_HomeViewModel.shows.drive(onNext: { [unowned self] (_) in
            self.customCollectionView.reloadData()
            }).disposed(by: disposeBag)
        new_HomeViewModel.tonightShows.drive(onNext: {[unowned self] (_) in
            self.midCV.reloadData()
            }).disposed(by: disposeBag)
        
        //loadPopularShows()
        setupHomeScrollView()
        setupHomeScrollViewContainer()
        setupHomeTopView()
        setupHomeMiddleView()
        setupLabelHomeBottomView()
        setupCollectionViewHomeBottomView()
        
    }
    
    
    func loadPopularShows() {
        modernVM.fetchPopularShows{ [weak self] in
            self?.customCollectionView.reloadData()
        }
        modernVM.fetchPopularTonight{ [weak self] in
            self?.customCollectionView.reloadData()
            self?.midCV.reloadData()
        }
    }
    
    
    let topIDCell = "topCell"
    let popularLable = UILabel()
    let customCollectionView: iCarousel = {
        let carousel = iCarousel()
        carousel.type = .rotary
        return carousel
    }()
    let topHomeView: UIView = {
        let view = UIView()
        // view.frame = CGRect(x: 0, y: 0, width: 500, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    let mainHomeView: UIView = {
        let view = UIView()
        //  view.frame = CGRect(x: 0, y: 150, width: 500, height: 600)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let midCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    let homeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let homeScrollViewContainer: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topBGView: UIView = {
        let view = UIView()
        let subview = UIView()
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subview)
        subview.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        subview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
        // MARK: -top corner backgroundView
        subview.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        subview.layer.cornerRadius = 50
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.backgroundColor = .clear
        return view
    }()
    
    let middleBGView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        return view
    }()
    
    let bottomBGView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 340).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.1254716814, green: 0.125500828, blue: 0.1254698336, alpha: 1)
        
        return view
    }()
}
extension NewModernHomeVC {
  
    func setupHomeScrollView() {
        homeScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupHomeScrollViewContainer() {
        homeScrollViewContainer.leadingAnchor.constraint(equalTo: homeScrollView.leadingAnchor).isActive = true
        homeScrollViewContainer.trailingAnchor.constraint(equalTo: homeScrollView.trailingAnchor).isActive = true
        homeScrollViewContainer.topAnchor.constraint(equalTo: homeScrollView.topAnchor, constant: 30).isActive = true
        homeScrollViewContainer.bottomAnchor.constraint(equalTo: homeScrollView.bottomAnchor).isActive = true
        
        homeScrollViewContainer.widthAnchor.constraint(equalTo: homeScrollView.widthAnchor).isActive = true
    }
    
    func setupHomeTopView() {
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.image = UIImage(named: "logo")
        topBGView.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.topAnchor.constraint(equalTo: topBGView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
    }
    
    func setupHomeMiddleView() {
         middleBGView.addSubview(customCollectionView)
        customCollectionView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
    }
    
    func setupLabelHomeBottomView() {
        bottomBGView.addSubview(popularLable)
        popularLable.text = "Popular shows tonight"
        popularLable.textColor = UIColor.white.withAlphaComponent(0.8)
        popularLable.layer.cornerRadius = 10
        popularLable.layer.masksToBounds = true
        popularLable.font = .boldSystemFont(ofSize: 30)
        popularLable.translatesAutoresizingMaskIntoConstraints = false
        popularLable.topAnchor.constraint(equalTo: customCollectionView.bottomAnchor, constant: 10).isActive = true
        popularLable.leadingAnchor.constraint(equalTo: middleBGView.leadingAnchor, constant: 10).isActive = true
        popularLable.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    func setupCollectionViewHomeBottomView() {
        bottomBGView.addSubview(midCV)
        midCV.backgroundColor = .clear
        midCV.delegate = self
        midCV.dataSource = self
    
        midCV.topAnchor.constraint(equalTo: popularLable.bottomAnchor, constant: 10).isActive = true
        midCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        midCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        midCV.heightAnchor.constraint(equalToConstant: view.frame.width/1.5).isActive = true
    }
    
    
    
}

extension NewModernHomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // print(modernVM.numberOfTonightShows())
        return new_HomeViewModel.numberOfTonigtShows /* modernVM.numberOfTonightShows() */
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
//        let thisShow = modernVM.getTonightShowByIndex(index: indexPath.row)
//        cell.label.text = thisShow.name
//        guard let image = URL(string:(thisShow.image?.original)!) else { return cell }
//        getImageFrom(url: image, for: cell.bg)
        if let showViweModel = new_HomeViewModel.tonightShowViewModelFor(index: indexPath.row){
             cell.mvvmConfigure(show: showViweModel)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ModernShowInfoVC()
        vc.showInfoVM = modernVM
        let thisShow = modernVM.getTonightShowByIndex(index: indexPath.row)
        vc.updateUserInterface(with: thisShow)
        self.navigationController?.pushViewController(vc, animated: true)
    
    }

}
// MARK: -iCarousel
extension NewModernHomeVC: iCarouselDataSource, iCarouselDelegate {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return new_HomeViewModel.numberOfShows /* modernVM.numberOfShows() */
}
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (self.view.frame.size.width/1.9), height: 300))
        let imageShow: UIImageView = {
            let imageView = UIImageView(frame: view.bounds)
            imageView.contentMode = .scaleToFill
            
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 40
            return imageView
        }()
        view.addSubview(imageShow)
        view.backgroundColor = .clear
    /*
        let currentShow = modernVM.showForIndex(index: index)
        guard let posterUrl = URL(string: (currentShow.image?.original)!) else {
            return view
        }
        imageShow.image = nil
        URLSession.shared.dataTask(with: posterUrl) { (data, response, error) in
            if let error = error {
                print("load image error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("empty image data")
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    imageShow.image = image
                }
            }
        }.resume()
    */
        if let showViewModel = new_HomeViewModel.showViewModelForIndex(index: index) {
            imageShow.kf.setImage(with: showViewModel.imageURL)
        }
        
        return view
    }

    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let vc = ModernShowInfoVC()
        
        let thisShow = modernVM.showForIndex(index: index)
        vc.showInfoVM = modernVM
        vc.updateUserInterface(with: thisShow)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
