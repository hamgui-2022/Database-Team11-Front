//
//  FinalRegisterViewController.swift
//  Database-Team11
//
//  Created by 이재혁 on 11/26/23.
//

import UIKit
import SnapKit

class FinalRegisterViewController: UIViewController {

    //var nickName: String = "햄구이구이"
    
    private let checkLabel1: UILabel = {
        let label = UILabel()
        label.text = "햄구이구이님으로"
        label.font = UIFont.pretendard(.bold, size: 40)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let checkLabel2: UILabel = {
        let label = UILabel()
        label.text = "가입하시겠습니까?"
        label.font = UIFont.pretendard(.bold, size: 40)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("가입하기", for: .normal)
        button.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        button.titleLabel?.font = UIFont.pretendard(.bold, size: 20)
        button.backgroundColor = UIColor(hex: "967BFF")
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(registerButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureRegister()
    }
    
    private func configureRegister() {
        [checkLabel1, checkLabel2, registerButton].forEach(view.addSubview(_:))
        
        checkLabel1.snp.makeConstraints({
            $0.top.equalTo(view.snp.top).offset(240)
            $0.centerX.equalToSuperview()
        })
        
        checkLabel2.snp.makeConstraints({
            $0.top.equalTo(checkLabel1.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        })
        
        registerButton.snp.makeConstraints({
            $0.top.equalTo(checkLabel2.snp.bottom).offset(110)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(55)
        })
    }
    
    @objc func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환 메서드 사용해서 화면 전환
        
        self.navigationController?.popToRootViewController(animated: true)
    }

}

@available(iOS 17.0, *)
#Preview("RegisterVC-5") {
    FinalRegisterViewController()
}
