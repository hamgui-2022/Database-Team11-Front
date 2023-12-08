//
//  ViewController.swift
//  Database-Team11
//
//  Created by 이재혁 on 11/26/23.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "Twitter"
        label.font = UIFont.pretendard(.extraBold, size: 60)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let IDTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 아이디"
        textField.font = UIFont.pretendard(.regular, size: 20)
        textField.textColor = UIColor(hex: "7C5CFF")
        textField.layer.cornerRadius = 10
        textField.layer.backgroundColor = UIColor(hex: "F4F4FF").cgColor
        
        return textField
    }()
    
    private let PWTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 비밀번호"
        textField.font = UIFont.pretendard(.regular, size: 20)
        textField.textColor = UIColor(hex: "7C5CFF")
        textField.layer.cornerRadius = 10
        textField.layer.backgroundColor = UIColor(hex: "F4F4FF").cgColor
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        button.titleLabel?.font = UIFont.pretendard(.bold, size: 20)
        button.backgroundColor = UIColor(hex: "967BFF")
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(UIColor(hex: "967BFF"), for: .normal)
        button.titleLabel?.font = UIFont.pretendard(.bold, size: 20)
        button.backgroundColor = UIColor(hex: "FFFFFF")
        
        button.layer.borderColor = UIColor(hex: "967BFF").cgColor
        button.layer.borderWidth = 2
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isEnabled = true
        
        button.addTarget(self, action: #selector(registerButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "FFFFFF")
        configurelogoLabel()
        configureTextFields()
        configureButtons()
    }

    private func configurelogoLabel() {
        view.addSubview(logoLabel)
        
        logoLabel.snp.makeConstraints({
            $0.top.equalTo(view.snp.top).offset(250)
            $0.centerX.equalToSuperview()
        })
    }
    
    private func configureTextFields() {
        [IDTextField, PWTextField].forEach(view.addSubview(_:))
        
        IDTextField.snp.makeConstraints({
            $0.top.equalTo(logoLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
        
        PWTextField.snp.makeConstraints({
            $0.top.equalTo(IDTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
    }
    
    private func configureButtons() {
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        loginButton.snp.makeConstraints({
            $0.top.equalTo(PWTextField.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
        
        registerButton.snp.makeConstraints({
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
    }

    @objc func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환 메서드 사용해서 화면 전환
        let registerVC = IDRegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func loginButtonDidTap(_ sender: UIButton) {
        let mainVC = WritingFeedViewController()
        mainVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
}


 @available(iOS 17.0, *)
 #Preview("LoginVC") {
     LoginViewController()
 }
 
