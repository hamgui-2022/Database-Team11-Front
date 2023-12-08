//
//  MainPageViewController.swift
//  Database-Team11
//
//  Created by 이재혁 on 12/1/23.
//

import UIKit
import SnapKit

class MainPageViewController: UIViewController {

    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "FFFFFF")

        configureScrollView()
        configureTopContainer()
        configureProfileElements()
        configureFeedText()
        configureDivider()
        configureCommentTable()
        configureFooterView()
        commentTableView.tableFooterView = writingCommentFooterView
    }
    
    // MARK: - UIComponents
    // scrollview 선언
    var scrollView: UIScrollView = UIScrollView().then {
        $0.backgroundColor = .white
    }
    
    // UIScrollView 안에 들어갈 객체들을 담은 View 선언
    var contentView: UIView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    // MARK: - 상단 통합 컨테이너
    lazy var topContainerView: UIView = UIView().then {
        $0.backgroundColor = .white
    }
    
    // MARK: - PROFILE HEADER
    // 프로필 이미지, 이름, 카테고리 컨테이너
    private let profileContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // 이름
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "햄구이구이"
        label.font = UIFont.pretendard(.semiBold, size: 14)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()

    // 프로필사진
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        // 이미지 설정
        imageView.image = UIImage(systemName: "person.circle.fill")
        // 이미지의 컨텐트 모드 설정 (옵션)
        imageView.contentMode = .scaleAspectFit
        // 이미지뷰 크기 설정 (옵션)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.tintColor = .systemBlue
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var isFollowing: Bool = false
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.pretendard(.medium, size: 14)
        button.setTitle("팔로우", for: .normal)
        //button.setTitleColor(UIColor(hex: "6E707B"), for: .normal)
        button.setTitleColor(UIColor(red: 0.431, green: 0.441, blue: 0.483, alpha: 0.8), for: .normal)
        button.backgroundColor = UIColor(hex: "EEF0F8")
        button.layer.cornerRadius = 10
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        
        button.addTarget(self, action: #selector(followingButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func followingButtonTapped() {
        if isFollowing {
                    followingButton.setTitle("팔로잉", for: .normal)
                } else {
                    followingButton.setTitle("팔로우", for: .normal)
                }
        isFollowing.toggle()
        print("Tapped") // 디버깅용
    }
    
    // MARK: - Configure scrollview
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        })
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints({
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        })
    }
    
    // MARK: - 상단 통합 컨테이너
    private func configureTopContainer() {
        contentView.addSubview(topContainerView)
        topContainerView.snp.makeConstraints({
            $0.width.equalToSuperview()
            $0.top.equalToSuperview() // 나중에 offset 바꾸기
            $0.height.equalTo(68)
        })
        
        [profileContainerView, followingButton].forEach(topContainerView.addSubview(_:))
        
        profileContainerView.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(128)
            $0.height.equalTo(36)
        })
        
        followingButton.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-12)
        })
    }
    
    // MARK: - 프로필 컨테이너 <- addsubviews
    private func configureProfileElements() {
        [nameLabel, profileImageView].forEach(profileContainerView.addSubview(_:))
        
        profileImageView.snp.makeConstraints({
            //            $0.top.bottom.left.equalToSuperview()
            //            $0.width.equalTo(profileContainerView.frame.height)
            $0.top.bottom.left.equalTo(profileContainerView).inset(0)
            $0.width.height.equalTo(36)
        })
        
        nameLabel.snp.makeConstraints({
            $0.bottom.equalTo(profileContainerView.snp.centerY).offset(2)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
        })
        
    }
    
    // MARK: - BODY (피드 텍스트)
    private let feedText: UILabel = UILabel().then {
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
    
    // MARK: - ADDSUBVIEW 피드 텍스트
    private func configureFeedText() {
        contentView.addSubview(feedText)
        feedText.snp.makeConstraints({
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(profileContainerView.snp.bottom).offset(30)
        })
    }
    
    // MARK: - (게시글 - 댓글) divider
    private let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "EEF0F8")
        return view
    }()
    
    // MARK: - ADDSUBVIEW divider
    private func configureDivider() {
        contentView.addSubview(dividerLineView)
        dividerLineView.snp.makeConstraints({
            $0.top.equalTo(feedText.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(2)
        })
    }
    
    // MARK: - 댓글 tableview
    lazy var commentTableView: UITableView = {
        let tableView = UITableView()
        //let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(FeedDetailCommentTableViewCell.self, forCellReuseIdentifier: "FeedDetailCommentTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        //tableView.tableFooterView = writingCommentFooterView
        return tableView
    }()

    // MARK: - ADDSUBVIEW 댓글 tableview
    private func configureCommentTable() {
        contentView.addSubview(commentTableView)
        var count = FeedComment.data.count
        commentTableView.snp.makeConstraints({
            $0.top.equalTo(dividerLineView.snp.bottom).offset(24)
            $0.left.right.equalToSuperview().inset(20)
            //$0.bottom.equalTo(contentView.snp.bottom).offset(90)
            $0.height.equalTo(count * 140)
            $0.bottom.equalToSuperview()
        })
    }
    
    // MARK: - 댓글쓰기 footer
    private let writingCommentFooterView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.frame.size.height = 50
    }
    
    private let commentTextField: UITextField = UITextField().then {
        $0.placeholder = "댓글을 입력하세요!"
        $0.font = UIFont.pretendard(.regular, size: 14)
        $0.borderStyle = UITextField.BorderStyle.roundedRect
        $0.autocorrectionType = UITextAutocorrectionType.no
        $0.keyboardType = UIKeyboardType.default
        $0.returnKeyType = UIReturnKeyType.done
        $0.clearButtonMode = UITextField.ViewMode.whileEditing
        $0.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
    
    private let registerCommentButton: UIButton = UIButton().then {
        $0.setTitle("작성", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
        $0.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        $0.backgroundColor = UIColor(hex: "475FFD")
        $0.layer.cornerRadius = 10
        $0.contentEdgeInsets = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        $0.addTarget(self, action: #selector(registerCommentBtnDidTap), for: .touchUpInside)
    }
    
    @objc func registerCommentBtnDidTap() {
        print("registerCommentBtnDidTap")
        
        FeedComment.data.append(FeedComment(profileImage: "cuteBokdol", name: "햄구이구이", comment: "안녕하세요. 이재혁입니다."))
        commentTableView.reloadData()
        commentTableView.tableFooterView = writingCommentFooterView
    }
    
    lazy var commentTextView: UITextView = UITextView().then {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(hex: "EEF0F8")
        $0.autocorrectionType = UITextAutocorrectionType.no
        $0.keyboardType = UIKeyboardType.default
        $0.returnKeyType = UIReturnKeyType.done
        $0.font = UIFont.pretendard(.regular, size: 14)
        $0.text = "댓글을 입력하세요"
        $0.textColor = UIColor(hex: "808497")
        $0.textContainerInset.top = 10
        $0.delegate = self
        $0.isEditable = true
    }
    
    private func configureFooterView() {
        [
            commentTextView, registerCommentButton
        ].forEach(writingCommentFooterView.addSubview(_:))
        commentTextView.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(5)
            $0.right.equalToSuperview().inset(50)
            $0.height.equalTo(40)
        })
        registerCommentButton.snp.makeConstraints({
            //$0.bottom.equalTo(commentTextField.snp.bottom)
            $0.centerY.equalToSuperview()
            //$0.right.equalToSuperview().inset(5)
            $0.left.equalTo(commentTextView.snp.right).offset(5)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 키보드 업&다운 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // 키보드 팝업하면 뷰를 올리는
    @objc func keyboardUp(notification:NSNotification) {
        if let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            
            UIView.animate(
                withDuration: 0.3
                , animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardRectangle.height)
                }
            )
        }
    }
    
    // 키보드 내려가면 원래대로
    @objc func keyboardDown() {
        self.view.transform = .identity
    }
    
}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedComment.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FeedDetailCommentTableViewCell") as? FeedDetailCommentTableViewCell
        else { return UITableViewCell() }
        
        let dataObject = FeedComment.data[indexPath.row]
        
        cell.configureCell(profileImage: dataObject.profileImage, name: dataObject.name, comment: dataObject.comment)

        cell.selectionStyle = .none
        return cell
    }

}

// MARK: - UITEXTVIEW extension
extension MainPageViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == UIColor(hex: "808497") else { return }
        textView.text = nil
        textView.textColor = .label
    }
}

 @available(iOS 17.0, *)
 #Preview("MPVC") {
     MainPageViewController()
 }
