//
//  WXXFilePreViewViewController.swift
//  SwiftFileManager
//
//  Created by DevZHR on 2017/8/17.
//  Copyright © 2017 DevZHR. All rights reserved.
//

import UIKit
import QuickLook

class WXXFilePreViewViewController: UIViewController {

    open var filePath: String?//文件路径
    open var fileArray: [WXXFileListModel] = [WXXFileListModel]()
    open var currentIndex: Int = 0
    
    //MARK: ControllerLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initControllerFirstData()
        createUI()
        loadData()
        registNotification()
    }
    
    deinit {
        print("dealloc:",self)
    }
    //MARK: LoadData
    private func loadData() {

    }
    
    private func initControllerFirstData() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "cancel", style: .plain, target: self, action: #selector(leftItemClick))
    }
    //MARK: Action
   @objc private func leftItemClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: AddNotificatoin
    private func registNotification() {
        
    }
    //MARK: CreateUI
    private func createUI() {
        previewVC.delegate = self
        previewVC.dataSource = self
        previewVC.hidesBottomBarWhenPushed = true
        previewVC.view.backgroundColor = .white
        view.addSubview(previewVC.view)
        previewVC.view.frame = self.view.bounds
        previewVC.currentPreviewItemIndex = self.currentIndex
        self.addChild(previewVC)
    }
    
    lazy var previewVC: QLPreviewController = {
        let VC = QLPreviewController()
        return VC
    }()
    //MARK: Helper
}

extension WXXFilePreViewViewController: QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.fileArray.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let model = self.fileArray[index]
        
        return  NSURL(fileURLWithPath: model.filePath)
    }
}
