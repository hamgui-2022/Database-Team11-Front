//
//  PWRegisterViewController.swift
//  Database-Team11
//
//  Created by 이재혁 on 11/26/23.
//

import UIKit
import SnapKit

class PWRegisterViewController: UIViewController {

    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입"
        label.font = UIFont.pretendard(.bold, size: 40)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let PWLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.pretendard(.bold, size: 20)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "7C5CFF")
        
        return view
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
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
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

        configureTop()
        configureBody()
    }
    
    private func configureTop() {
        [registerLabel, PWLabel, lineView].forEach(view.addSubview(_:))
        
        registerLabel.snp.makeConstraints({
            $0.top.equalTo(view.snp.top).offset(130)
            $0.centerX.equalToSuperview()
        })
        
        PWLabel.snp.makeConstraints({
            $0.top.equalTo(registerLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        })
        
        lineView.snp.makeConstraints({
            $0.top.equalTo(PWLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(1)
        })
    }
    
    private func configureBody() {
        [PWTextField, nextButton].forEach(view.addSubview(_:))
        
        PWTextField.snp.makeConstraints({
            $0.top.equalTo(lineView.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
        
        nextButton.snp.makeConstraints({
            $0.top.equalTo(PWTextField.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(55)
        })
    }
    
    @objc func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환 메서드 사용해서 화면 전환
        let registerVC = EmailRegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

}

@available(iOS 17.0, *)
#Preview("RegisterVC-2") {
    PWRegisterViewController()
}
