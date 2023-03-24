//
//  ViewController.swift
//  task8
//
//  Created by Alex Antropoff on 24.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let avatarImageView = UIImageView()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        setupAvatarImage()
        setupScrollView()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        if #available(iOS 11.0, *) {
            for subview in navigationBar.subviews {
                let stringFromClass = NSStringFromClass(subview.classForCoder)
                if stringFromClass.contains("UINavigationBarLargeTitleView") {
                    subview.addSubview(self.avatarImageView)
                    NSLayoutConstraint.activate([
                        self.avatarImageView.widthAnchor.constraint(equalToConstant: 36),
                        self.avatarImageView.heightAnchor.constraint(equalToConstant: 36),
                        self.avatarImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -16),
                        self.avatarImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -12)
                    ])
                }
            }
        }
    }
    func configureNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true
        navigationItem.title = "Avatar"
    }
    
    
    func setupAvatarImage() {
        avatarImageView.image = UIImage(systemName: "person.crop.circle.fill")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 18
        avatarImageView.tintColor = .gray
    }
    func setupScrollView() {
        scrollView.contentSize = view.frame.size
        scrollView.frame = CGRect(origin: .zero, size: view.frame.size)
        view.addSubview(scrollView)
    }
}
