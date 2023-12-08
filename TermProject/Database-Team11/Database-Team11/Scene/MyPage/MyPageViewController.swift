//
//  MyPageViewController.swift
//  Database-Team11
//
//  Created by 이재혁 on 12/3/23.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureTop()
        configureFollowers()
        configureButton()
        
        let nameTapGesture = UITapGestureRecognizer(target: self, action: #selector(nameDidTap))
        
        followingName1Label.addGestureRecognizer(nameTapGesture)
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "햄구이구이"
        label.font = UIFont.pretendard(.extraBold, size: 60)
        label.textColor = .black
        
        return label
    }()
    
    private let changePWButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 변경", for: .normal)
        button.setTitleColor(UIColor(hex: "967BFF"), for: .normal)
        button.titleLabel?.font = UIFont.pretendard(.bold, size: 20)
        button.backgroundColor = UIColor(hex: "FFFFFF")
        
        button.layer.borderColor = UIColor(hex: "967BFF").cgColor
        button.layer.borderWidth = 2
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(changePWButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    @objc func changePWButtonDidTap() {
        let PWVC = ChangePWViewController()
        PWVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(PWVC, animated: true)
    }
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉"
        label.font = UIFont.pretendard(.extraBold, size: 24)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let followingNumLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.font = UIFont.pretendard(.extraBold, size: 24)
        label.textColor = .black
        
        return label
    }()
    
    private let followLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로우"
        label.font = UIFont.pretendard(.extraBold, size: 24)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let followNumLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.font = UIFont.pretendard(.extraBold, size: 24)
        label.textColor = .black
        
        return label
    }()
    
    var profileImageView1: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        //imageView.image = UIImage(named: "cuteBokdol")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let followingName1Label : UILabel = {
        let label = UILabel()
        label.text = "서은주"
        label.font = UIFont.pretendard(.semiBold, size: 20)
        label.textColor = UIColor(hex: "24252E")
        
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    @objc func nameDidTap(sender: UITapGestureRecognizer) {
        print("didtap")
        
        let followerFeedVC = FollowerFeedViewController()
        followerFeedVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(followerFeedVC, animated: true)
    }
    
    var profileImageView2: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        //imageView.image = UIImage(named: "cuteBokdol")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let followingName2Label : UILabel = {
        let label = UILabel()
        label.text = "이범준"
        label.font = UIFont.pretendard(.semiBold, size: 20)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    var profileImageView3: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        //imageView.image = UIImage(named: "cuteBokdol")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let followingName3Label : UILabel = {
        let label = UILabel()
        label.text = "이재혁"
        label.font = UIFont.pretendard(.semiBold, size: 20)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    var profileImageView4: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        //imageView.image = UIImage(named: "cuteBokdol")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let followingName4Label : UILabel = {
        let label = UILabel()
        label.text = "유현석"
        label.font = UIFont.pretendard(.semiBold, size: 20)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    var profileImageView5: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        //imageView.image = UIImage(named: "cuteBokdol")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let followingName5Label : UILabel = {
        let label = UILabel()
        label.text = "서은주"
        label.font = UIFont.pretendard(.semiBold, size: 20)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    var profileImageView6: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        //imageView.image = UIImage(named: "cuteBokdol")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let followingName6Label : UILabel = {
        let label = UILabel()
        label.text = "이범준"
        label.font = UIFont.pretendard(.semiBold, size: 20)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    var profileImageView7: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        //imageView.image = UIImage(named: "cuteBokdol")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let followingName7Label : UILabel = {
        let label = UILabel()
        label.text = "이재혁"
        label.font = UIFont.pretendard(.semiBold, size: 20)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    var profileImageView8: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "person.circle.fill")
        //imageView.image = UIImage(named: "cuteBokdol")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    // 이름
    private let followingName8Label : UILabel = {
        let label = UILabel()
        label.text = "유현석"
        label.font = UIFont.pretendard(.semiBold, size: 20)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    private func configureTop() {
        [nameLabel, followingLabel, followingNumLabel, followLabel, followNumLabel].forEach(view.addSubview(_:))
        
        nameLabel.snp.makeConstraints({
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        })
        
        followingLabel.snp.makeConstraints({
            $0.top.equalTo(nameLabel.snp.bottom).offset(100)
            $0.centerX.equalToSuperview().offset(-90)
        })
        
        followLabel.snp.makeConstraints({
            $0.top.equalTo(nameLabel.snp.bottom).offset(100)
            $0.centerX.equalToSuperview().offset(90)
        })
        
        followingNumLabel.snp.makeConstraints({
            $0.top.equalTo(followingLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(followingLabel)
        })
        
        followNumLabel.snp.makeConstraints({
            $0.top.equalTo(followLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(followLabel)
        })
    }
    
    private func configureFollowers() {
        [profileImageView1, profileImageView2, profileImageView3, profileImageView4, profileImageView5, profileImageView6, profileImageView7, profileImageView8].forEach(view.addSubview(_:))
        [followingName1Label, followingName2Label, followingName3Label, followingName4Label, followingName5Label, followingName6Label, followingName7Label, followingName8Label].forEach(view.addSubview(_:))
        
        profileImageView1.snp.makeConstraints({
            $0.top.equalTo(followingNumLabel.snp.bottom).offset(23)
            $0.centerX.equalTo(followingNumLabel).offset(-30)
        })
        
        followingName1Label.snp.makeConstraints({
            $0.top.equalTo(followingNumLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(followingNumLabel).offset(15)
        })
        
        profileImageView2.snp.makeConstraints({
            $0.top.equalTo(profileImageView1.snp.bottom).offset(23)
            $0.centerX.equalTo(followingNumLabel).offset(-30)
        })
        
        followingName2Label.snp.makeConstraints({
            $0.top.equalTo(followingName1Label.snp.bottom).offset(20)
            $0.centerX.equalTo(followingNumLabel).offset(15)
        })
        
        profileImageView3.snp.makeConstraints({
            $0.top.equalTo(profileImageView2.snp.bottom).offset(23)
            $0.centerX.equalTo(followingNumLabel).offset(-30)
        })
        
        followingName3Label.snp.makeConstraints({
            $0.top.equalTo(followingName2Label.snp.bottom).offset(20)
            $0.centerX.equalTo(followingNumLabel).offset(15)
        })
        
        profileImageView4.snp.makeConstraints({
            $0.top.equalTo(profileImageView3.snp.bottom).offset(23)
            $0.centerX.equalTo(followingNumLabel).offset(-30)
        })
        
        followingName4Label.snp.makeConstraints({
            $0.top.equalTo(followingName3Label.snp.bottom).offset(20)
            $0.centerX.equalTo(followingNumLabel).offset(15)
        })
        
        profileImageView5.snp.makeConstraints({
            $0.top.equalTo(followingNumLabel.snp.bottom).offset(23)
            $0.centerX.equalTo(followNumLabel).offset(-30)
        })
        
        followingName5Label.snp.makeConstraints({
            $0.top.equalTo(followNumLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(followNumLabel).offset(15)
        })
        
        profileImageView6.snp.makeConstraints({
            $0.top.equalTo(profileImageView5.snp.bottom).offset(23)
            $0.centerX.equalTo(followNumLabel).offset(-30)
        })
        
        followingName6Label.snp.makeConstraints({
            $0.top.equalTo(followingName5Label.snp.bottom).offset(20)
            $0.centerX.equalTo(followNumLabel).offset(15)
        })
        
        profileImageView7.snp.makeConstraints({
            $0.top.equalTo(profileImageView6.snp.bottom).offset(23)
            $0.centerX.equalTo(followNumLabel).offset(-30)
        })
        
        followingName7Label.snp.makeConstraints({
            $0.top.equalTo(followingName6Label.snp.bottom).offset(20)
            $0.centerX.equalTo(followNumLabel).offset(15)
        })
        
        profileImageView8.snp.makeConstraints({
            $0.top.equalTo(profileImageView7.snp.bottom).offset(23)
            $0.centerX.equalTo(followNumLabel).offset(-30)
        })
        
        followingName8Label.snp.makeConstraints({
            $0.top.equalTo(followingName7Label.snp.bottom).offset(20)
            $0.centerX.equalTo(followNumLabel).offset(15)
        })
        
    }
    
    private func configureButton() {
        view.addSubview(changePWButton)
        
        changePWButton.snp.makeConstraints({
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(40)
        })
    }

}


@available(iOS 17.0, *)
#Preview("MyPageVC") {
    MyPageViewController()
}
