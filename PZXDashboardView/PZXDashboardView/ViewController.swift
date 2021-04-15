//
//  ViewController.swift
//  PZXDashboardView
//
//  Created by quark123321 on 2021/4/14.
//

import UIKit

class ViewController: UIViewController {

    var pzxsharpCircleView = PZXDashboardView.init(frame: CGRect.init(x: 150, y: 200, width: 200, height: 200))
    var pzxspeedView : PZXSpeedDialView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initPZXSharpCircle()
        
        self.initPZXSpeedView()

    }


    
    func initPZXSharpCircle() {
        
//        self.pzxsharpCircleView = PZXDashboardView.init(frame: CGRect.init(x: 150, y: 200, width: 200, height: 200))
        self.pzxsharpCircleView.backgroundColor = UIColor.cyan
        self.view .addSubview(self.pzxsharpCircleView)
                
    }
    
    func initPZXSpeedView() {
        
        self.pzxspeedView = PZXSpeedDialView.init(frame: CGRect.init(x: 160, y: 600, width: 100, height: 100))
        self.pzxspeedView?.backgroundColor = UIColor.orange
        self.view.addSubview(self.pzxspeedView!)
                
    }
}

