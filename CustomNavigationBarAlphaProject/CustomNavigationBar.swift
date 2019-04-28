//
//  CustomNavigationBar.swift
//  CustomNavigationBarAlphaProject
//
//  Created by zhifu360 on 2019/4/28.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class CustomNavigationBar: UIView {

    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: (self.bounds.size.height-15)/2+5, width: self.bounds.size.width, height: 15))
        label.text = "导航栏"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        backgroundColor = .white//设置背景色
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
