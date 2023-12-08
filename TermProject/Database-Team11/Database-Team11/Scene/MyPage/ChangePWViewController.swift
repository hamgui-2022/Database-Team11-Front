//
//  ChangePWViewController.swift
//  Database-Team11
//
//  Created by 이재혁 on 12/3/23.
//

import UIKit

class ChangePWViewController: UIViewController {

    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 변경"
        label.font = UIFont.pretendard(.bold, size: 40)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let etcLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.pretendard(.bold, size: 20)
        label.textColor = UIColor(hex: "7C5CFF")
        
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "7C5CFF")
        
        return view
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 현재 비밀번호"
        textField.font = UIFont.pretendard(.regular, size: 20)
        textField.textColor = UIColor(hex: "7C5CFF")
        textField.layer.cornerRadius = 10
        textField.layer.backgroundColor = UIColor(hex: "F4F4FF").cgColor
        
        return textField
    }()
    
    private let nickNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " "
        textField.font = UIFont.pretendard(.regular, size: 20)
        textField.textColor = UIColor(hex: "7C5CFF")
        textField.layer.cornerRadius = 10
        textField.layer.backgroundColor = UIColor(hex: "F4F4FF").cgColor
        textField.isHidden = true
        
        return textField
    }()
    
    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 새 비밀번호"
        textField.font = UIFont.pretendard(.regular, size: 20)
        textField.textColor = UIColor(hex: "7C5CFF")
        textField.layer.cornerRadius = 10
        textField.layer.backgroundColor = UIColor(hex: "F4F4FF").cgColor
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 변경하기", for: .normal)
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
        [registerLabel, etcLabel, lineView].forEach(view.addSubview(_:))
        
        registerLabel.snp.makeConstraints({
            $0.top.equalTo(view.snp.top).offset(130)
            $0.centerX.equalToSuperview()
        })
        
        etcLabel.snp.makeConstraints({
            $0.top.equalTo(registerLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        })
        
        lineView.snp.makeConstraints({
            $0.top.equalTo(etcLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(1)
        })
    }
    
    private func configureBody() {
        [nameTextField, nickNameTextField, genderTextField,  nextButton].forEach(view.addSubview(_:))
        
        nameTextField.snp.makeConstraints({
            $0.top.equalTo(lineView.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
        
        nickNameTextField.snp.makeConstraints({
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
        
        genderTextField.snp.makeConstraints({
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
        
        nextButton.snp.makeConstraints({
            $0.top.equalTo(genderTextField.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(55)
        })
    }
    
    @objc func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환 메서드 사용해서 화면 전환
//        let registerVC = FinalRegisterViewController()
//        registerVC.modalPresentationStyle = .fullScreen
//        
//        self.navigationController?.pushViewController(registerVC, animated: true)
        // 인스턴스 생성
                let alert = UIAlertController(title: "비밀번호 변경", message: "비밀번호가 변경되었습니다.", preferredStyle: .alert)
                // 액션 생성
                let success = UIAlertAction(title: "확인", style: .default){ action in
                    print("확인 버튼이 눌렸습니다.",
                          self.navigationController?.popViewController(animated: true)
                    )
                }

                alert.addAction(success)

                //화면에 표현
                present(alert, animated: true)
    }

}

@available(iOS 17.0, *)
#Preview("ChangePWVC") {
    ChangePWViewController()
}
