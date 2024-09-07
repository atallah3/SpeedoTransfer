//
//  OnboardingVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 06/09/2024.
//

import UIKit

class OnboardingVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - Properties
    var slides: [OnboardingSlide] = []
    var currentPage = 0
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectoinView()
        getSlideData()
    }

    //MARK: - Functions
    private func configureViewController() {
        view.addGradientBackgroundColor(colors: UIColor.SecondGradientolors)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configureCollectoinView() {
        let nib = UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func getSlideData() {
        slides.append(contentsOf: [
            OnboardingSlide(image: UIImage(named: "Amount")!, title: "Amont", subTitle: "Send money fast with simple steps. Create account, Confirmation, Payment. Simple."),
            OnboardingSlide(image: UIImage(named: "Confirmation")!, title: "Confirmation", subTitle:" Transfer funds instantly to friends and family worldwide, strong shield protecting a money."),
            OnboardingSlide(image: UIImage(named: "Payment")!, title: "Payment", subTitle: "Enjoy peace of mind with our secure platform  Transfer funds instantly to friends.")
        ])
        collectionView.reloadData()
    }
    
    private func goToRegisterScreen() {
        let registerVC = RegisterVC(nibName: "RegisterVC", bundle: nil)
        registerVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    private func goToNextOnboardingCell() {
        currentPage += 1
        pageControl.currentPage = currentPage
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    //MARK: - @IBActions
    @IBAction func skipBtnTapped(_ sender: UIButton) {
        goToRegisterScreen()
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            goToRegisterScreen()
        } else {
            goToNextOnboardingCell()
        }
    }
    
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource,
                       UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        cell.configureCell(slide: slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
