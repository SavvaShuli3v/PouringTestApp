//
//  BackView.swift
//  PouringAppTest
//
//  Created by Савва Шулятьев on 11.03.2022.
//

import UIKit

final class BackView: UIView {
    private lazy var backContentView = AnimateContentView()
    private lazy var contest = makeContest()
    private lazy var mainLabel = makeMainLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
        layoutBackContentView()
        setupContest()
        setupFakeViews()
        setupMainLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutBackContentView() {
        addSubview(backContentView)
        backContentView.translatesAutoresizingMaskIntoConstraints = false
        backContentView.top(68)
        backContentView.leading(10)
        backContentView.trailing(-10)
        backContentView.bottom(-104)
    }
    
    private func setupFakeViews() {
        let fakeView1 = UIView()
        fakeView1.backgroundColor = UIColor(red: 0.851, green: 0.157, blue: 0.184, alpha: 1)
        addSubview(fakeView1)
        fakeView1.translatesAutoresizingMaskIntoConstraints = false
        fakeView1.top(68)
        fakeView1.width(100)
        fakeView1.trailing(6, to: leadingAnchor)
        fakeView1.bottom(-104)
        fakeView1.layer.cornerRadius = 16
        
        let fakeView2 = UIView()
        fakeView2.backgroundColor = UIColor(red: 0.851, green: 0.157, blue: 0.184, alpha: 1)
        addSubview(fakeView2)
        fakeView2.translatesAutoresizingMaskIntoConstraints = false
        fakeView2.top(68)
        fakeView2.width(100)
        fakeView2.leading(-6, to: trailingAnchor)
        fakeView2.bottom(-104)
        fakeView2.layer.cornerRadius = 16
    }
    
    private func setupContest() {
        addSubview(contest)
        contest.translatesAutoresizingMaskIntoConstraints = false
        contest.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contest.bottom(-90)
        contest.width(33)
        contest.height(6)
        
        let view1 = UIView()
        view1.backgroundColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
        view1.layer.borderWidth = 1.5
        view1.layer.borderColor = UIColor.white.cgColor
        contest.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.top(to: contest.topAnchor)
        view1.leading(to: contest.leadingAnchor)
        view1.width(6)
        view1.height(6)
        view1.layer.cornerRadius = 3
        
        let view2 = UIView()
        view2.layer.borderWidth = 1.5
        view2.layer.borderColor = UIColor.white.cgColor
        contest.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.top(to: contest.topAnchor)
        view2.leading(3, to: view1.trailingAnchor)
        view2.width(6)
        view2.height(6)
        view2.layer.cornerRadius = 3
        
        let view3 = UIView()
        view3.backgroundColor = .white
        contest.addSubview(view3)
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.top(to: contest.topAnchor)
        view3.leading(3, to: view2.trailingAnchor)
        view3.width(6)
        view3.height(6)
        view3.layer.cornerRadius = 3
        
        let view4 = UIView()
        view4.layer.borderWidth = 1.5
        view4.layer.borderColor = UIColor.white.cgColor
        contest.addSubview(view4)
        view4.translatesAutoresizingMaskIntoConstraints = false
        view4.top(to: contest.topAnchor)
        view4.trailing(to: contest.trailingAnchor)
        view4.width(6)
        view4.height(6)
        view4.layer.cornerRadius = 3
    }
    
    private func setupMainLabel() {
        addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.bottom(-44)
        mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}

private func makeContest() -> UIView {
    let view = UIView()
    view.backgroundColor = .clear
    return view
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.text = "Пропустить"
    label.textColor = .white
    label.font = .systemFont(ofSize: 16, weight: .medium)
    return label
}
