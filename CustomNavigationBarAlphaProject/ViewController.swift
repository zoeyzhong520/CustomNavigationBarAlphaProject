//
//  ViewController.swift
//  CustomNavigationBarAlphaProject
//
//  Created by zhifu360 on 2019/4/28.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - 定义控件
    lazy var customNavigationBar: CustomNavigationBar = {
        let bar = CustomNavigationBar(frame: CGRect(x: 0, y: 0, width: ScreenSize.width, height: NavigationBarHeight+StatusBarHeight))
        bar.alpha = 0
        return bar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: IsSystemVersion11 ? -StatusBarHeight : 0, width: ScreenSize.width, height: ScreenSize.height+(IsSystemVersion11 ? StatusBarHeight : 0)), style: .plain)
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: BaseTableReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setPage()
    }
    
    ///UI
    func setNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setPage() {
        view.backgroundColor = .white
        //注意：先添加UITableView
        view.addSubview(tableView)
        view.addSubview(customNavigationBar)
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    //UITableViewDelegate && UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: BaseTableReuseIdentifier, for: indexPath)
        cell.backgroundColor = RGBColor(CGFloat(indexPath.row)+CGFloat(arc4random()%256),CGFloat(arc4random()%256),CGFloat(arc4random()%256))
        cell.selectionStyle = .none
        return cell
    }
    
    //UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //监听滑动时的偏移量计算百分比，修改自定义导航栏的透明度
        let offSet = scrollView.contentOffset
        if offSet.y >= NavigationBarHeight+StatusBarHeight {
            customNavigationBar.alpha = 1
        } else {
            customNavigationBar.alpha = (offSet.y < 0 ? 0 : offSet.y) / (NavigationBarHeight+StatusBarHeight)
        }

    }
}





