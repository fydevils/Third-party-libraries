//
//  ViewController.swift
//  qwer
//
//  Created by 李娜 on 2019/2/25.
//  Copyright © 2019 李娜. All rights reserved.
//

import UIKit
import PermissionScope
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 初jhgg始化权限管理对象
        PermissionScopeManager = PermissionScope.init(backgroundTapCancels: true)
        PermissionScopeManager.viewControllerForAlerts = self
        
        /// 执行此方法，如果要获取的权限被拒绝，会弹出提示框，告诉用户权限被拒绝，点击确认按钮会打开系统的权限设置
        PermissionScopeManager.onDisabledOrDenied = { result in
            print("onDisabledOrDenied:权限被拒绝")
        }
    }
    
    /// 权限管理的对象
    private var PermissionScopeManager: PermissionScope!
    
    /// 请求访问日历的权限
    @IBAction func requestEvents(_ sender: UIButton) {
        
        PermissionScopeManager.requestEvents()
        PermissionScopeManager.onAuthChange = { (finished: Bool, results) in
            /// 权限请求完成会执行此处代码
            /// 此处为打印日历访问的权限
            print(self.PermissionScopeManager.statusEvents())
        }
    }


    @IBAction func requestNotification(_ sender: UIButton) {
        PermissionScopeManager.requestNotifications()
        PermissionScopeManager.onAuthChange = { (finished: Bool, results) in
            /// 权限请求完成会执行此处代码
            /// 此处为打印发送通知的权限
            print(self.PermissionScopeManager.statusNotifications())
        }
    }
    
//    @IBAction func requestReminders(_ sender: UIButton) {
//        
//        PermissionScopeManager.requestReminders()
//        PermissionScopeManager.onAuthChange = { (finished: Bool, results) in
//            /// 权限请求完成会执行此处代码
//            /// 此处为打印访问提醒事项的权限
//            print(self.PermissionScopeManager.statusReminders())
//        }
//    }
//    
}

