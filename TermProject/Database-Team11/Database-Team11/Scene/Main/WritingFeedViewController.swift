//
//  WritingFeedViewController.swift
//  Database-Team11
//
//  Created by 이재혁 on 12/1/23.
//

import UIKit
import SnapKit
import Then

class WritingFeedViewController: UIViewController {
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "Twitter"
        label.font = UIFont.pretendard(.extraBold, size: 60)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let toMyPageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "m.circle"), for: .normal)
        button.tintColor = UIColor(hex: "7C5CFF")
        button.addTarget(self, action: #selector(myPageBtnDidTap), for: .touchUpInside)
        
        return button
    }()
    
    @objc func myPageBtnDidTap() {
        // 화면전환 메서드 사용해서 화면 전환
        let MyPageVC = MyPageViewController()
        MyPageVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(MyPageVC, animated: true)
    }
    
    private let IDTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 글을 입력하세요"
        textField.font = UIFont.pretendard(.regular, size: 20)
        textField.textColor = UIColor(hex: "7C5CFF")
        textField.layer.cornerRadius = 10
        textField.layer.backgroundColor = UIColor(hex: "F4F4FF").cgColor
        
        return textField
    }()
    
    private let introduceLabel: UILabel = {
        let label = UILabel()
        label.text = "피드 업로드를 위해 글을 입력하세요!"
        label.font = UIFont.pretendard(.bold, size: 20)
        label.textColor = UIColor(hex: "7C5CCC")
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("업로드", for: .normal)
        button.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        button.titleLabel?.font = UIFont.pretendard(.bold, size: 20)
        button.backgroundColor = UIColor(hex: "967BFF")
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    private let feedLabel: UILabel = {
        let label = UILabel()
        label.text = "게시글"
        label.font = UIFont.pretendard(.bold, size: 24)
        label.textColor = UIColor(hex: "7C5CCC")
        
        return label
    }()
    
    private let commentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "7C5CFF").cgColor
        
        return view
    }()
    
    // 프사
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "햄구이구이"
        label.font = UIFont.pretendard(.semiBold, size: 14)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    // 게시글view
    private let feedView: UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(hex: "7C5CFF").cgColor
        view.isHidden = true
        
        return view
    }()
    
    // 댓글
    private let commentText: UILabel = UILabel().then {
        $0.textColor = UIColor(hex: "200E04")
        $0.font = UIFont.pretendard(.regular, size: 14)
        $0.numberOfLines = 0
        $0.alpha = 0.9
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        paragraphStyle.lineBreakMode = .byCharWrapping
        //paragraphStyle.lineBreakStrategy = .hangulWordPriority
        $0.attributedText = NSMutableAttributedString(
            string: "햄구이구이입니다. 데이터베이스 11조입니다.",
            attributes: [.paragraphStyle: paragraphStyle]
        )
    }
    
    var isHeartFilled: Bool = false
    
    private let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = UIColor(hex: "24252E")
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func heartButtonTapped() {
        isHeartFilled.toggle()
        print("Tapped: heart Filled: \(isHeartFilled)")
        
        if isHeartFilled {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = UIColor(hex: "FF4D77")
            heartRate.text = "1"
        } else {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = UIColor(hex: "24252E")
            heartRate.text = "0"
        }
    }
    
    private let heartRate: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.font = UIFont.pretendard(.regular, size: 14)
        label.textColor = UIColor(hex: "24252E")
        
        return label
    }()
    
    private let messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = UIColor(hex: "24252E")
        button.addTarget(self, action: #selector(msgBtnDidTap), for: .touchUpInside)
        
        return button
    }()
    
    @objc func msgBtnDidTap() {
        let mainVC = MainPageViewController()
        mainVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    private let messageRate: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.pretendard(.regular, size: 14)
        label.textColor = UIColor(hex: "24252E")
        
        return label
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        view.backgroundColor = UIColor(hex: "FFFFFF")
        configurelogoLabel()
        configureTextFields()
        configureIntroLabel()
        configureButtons()
        configureFeed()
        configureLikeComment()
        configureToMyPageButton()
    }
    
    private func configureToMyPageButton() {
        view.addSubview(toMyPageButton)
        
        toMyPageButton.snp.makeConstraints({
            $0.centerY.equalTo(logoLabel)
            $0.leading.equalTo(logoLabel.snp.trailing).offset(20)
            $0.height.width.equalTo(50)
        })
    }
    
    private func configurelogoLabel() {
        view.addSubview(logoLabel)
        
        logoLabel.snp.makeConstraints({
            $0.top.equalTo(view.snp.top).offset(80)
            $0.centerX.equalToSuperview().offset(-80)
        })
    }
    
    private func configureIntroLabel() {
        view.addSubview(introduceLabel)
        
        introduceLabel.snp.makeConstraints({
            $0.top.equalTo(logoLabel.snp.bottom).offset(50)
            $0.leading.equalTo(IDTextField)
        })
    }
    
    private func configureTextFields() {
        [IDTextField].forEach(view.addSubview(_:))
        
        IDTextField.snp.makeConstraints({
            $0.top.equalTo(logoLabel.snp.bottom).offset(80)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(150)
        })
        
    }
    
    private func configureButtons() {
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints({
            $0.top.equalTo(IDTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
    }
    
    private func configureFeed() {
        view.addSubview(feedView)
        
        feedView.snp.makeConstraints({
            $0.top.equalTo(loginButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(100)
        })
        
        [profileImageView, nameLabel, commentText].forEach(feedView.addSubview(_:))
        
        profileImageView.snp.makeConstraints({
            $0.top.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(36)
        })
        
        nameLabel.snp.makeConstraints({
            $0.top.equalTo(profileImageView.snp.bottom)
            $0.centerX.equalTo(profileImageView)
        })
        
        commentText.snp.makeConstraints({
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
        })
    }
    
    private func configureLikeComment() {
        [heartButton, messageButton].forEach(feedView.addSubview(_:))
        
        heartButton.snp.makeConstraints({
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(5)
            $0.height.width.equalTo(25)
        })
        
        messageButton.snp.makeConstraints({
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(heartButton.snp.trailing).offset(5)
            $0.height.width.equalTo(25)
        })
    }
    
    @objc func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환 메서드 사용해서 화면 전환
        let registerVC = IDRegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func loginButtonDidTap(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0.5, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            self.feedView.alpha = 0
        }, completion: { finished in
            self.feedView.isHidden = false
            self.feedView.alpha = 1
        })
    }
}

@available(iOS 17.0, *)
#Preview("WritingFeedVC") {
    WritingFeedViewController()
}
