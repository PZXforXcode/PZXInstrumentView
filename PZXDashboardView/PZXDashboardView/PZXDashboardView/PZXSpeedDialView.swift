//
//  PZXSpeedDialView.swift
//  PZXDashboardView
//
//  Created by quark123321 on 2021/4/15.
//

import UIKit

class PZXSpeedDialView: UIView {


    override func draw(_ rect: CGRect) {
        // Drawing code
        //主要解释一下各个参数的意思
         //center  中心点（可以理解为圆心）
         //radius  半径
         //startAngle 起始角度
         //endAngle  结束角度
         //clockwise  是否顺时针
        let circle = UIBezierPath.init(arcCenter: CGPoint.init(x: rect.size.width/2, y: rect.size.height/2), radius: 95, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
        
        let shapelayer = CAShapeLayer.init()
        shapelayer.lineWidth = 5;
        shapelayer.fillColor = UIColor.clear.cgColor
        shapelayer.strokeColor = UIColor.green.cgColor
        shapelayer.path = circle.cgPath
        self.layer.addSublayer(shapelayer)
        
        
        let 刻度 = 50
        let perAngle = CGFloat.pi / CGFloat(刻度)
        //我们需要计算出每段弧线的起始角度和结束角度
        //这里我们从- M_PI 开始，我们需要理解与明白的是我们画的弧线与内侧弧线是同一个圆心
        
        for i in 0...刻度 {
            
            let startAngel = CGFloat(CGFloat.pi + perAngle * CGFloat(i))
            let endAngel = startAngel + perAngle/5;
            let tickPath = UIBezierPath.init(arcCenter: CGPoint.init(x: rect.size.width/2, y: rect.size.height/2), radius: 120, startAngle: startAngel, endAngle: endAngel, clockwise: true)
            let perLayer = CAShapeLayer.init()
            
            if i%5 == 0 {
                perLayer.strokeColor = UIColor.blue.cgColor
                perLayer.lineWidth = 10
                
            }else{
                
                perLayer.strokeColor = UIColor.lightGray.cgColor
                perLayer.lineWidth = 5
            }
            
            perLayer.path = tickPath.cgPath
            self.layer .addSublayer(perLayer)
        }
        
    }
}
