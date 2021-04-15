//
//  PZXDashboardView.swift
//  PZXDashboardView
//
//  Created by quark123321 on 2021/4/14.
//

import UIKit

class PZXDashboardView: UIView {
    
    var pzx_shapeLayer:CAShapeLayer?
    var gradientLayer:CAGradientLayer?
    let start : CGFloat = 0.15
    let end : CGFloat = 0.85
    let labelArray = ["0","差","20","较差","40","一般","60","良好","80","优秀","100"]
    let lineNum = 100
    override func draw(_ rect: CGRect) {
        
        let lineWidth:CGFloat = 10.0;
        
        //正常是 pi 到 0   我这里是3/4排 到1/4π 然后 start = 0.15  end = 0.85
        let circlePath = UIBezierPath.init(arcCenter: CGPoint.init(x: rect.size.width/2, y: rect.size.height/2), radius: (rect.size.width - lineWidth)/2, startAngle: CGFloat(Double.pi / 4 + Double.pi / 2), endAngle: CGFloat(Double.pi / 4), clockwise: true)
        
        
        
//        let circlePath = UIBezierPath.init(arcCenter: CGPoint.init(x: 10, y: 10), radius: 10, startAngle: 0, endAngle: 10, clockwise: true)
        
        let bgLayer = CAShapeLayer.init()
        bgLayer.frame = self.bounds
        bgLayer.fillColor = UIColor.clear.cgColor
        bgLayer.lineWidth = lineWidth
        bgLayer.strokeColor = UIColor.lightGray.cgColor
        bgLayer.strokeStart = start
        bgLayer.strokeEnd = end
        bgLayer.lineCap = CAShapeLayerLineCap.round
        bgLayer.path = circlePath.cgPath
        self.layer.addSublayer(bgLayer)
        
        gradientLayer = CAGradientLayer.init()

        let GradientLayer = CAGradientLayer.init()
        GradientLayer.frame = CGRect.init(x: 0, y: 0, width: rect.size.width, height: rect.size.height)
        GradientLayer.colors = [UIColor.yellow.cgColor,UIColor.orange.cgColor,UIColor.red.cgColor]
        GradientLayer.locations = [0,0.6]
        GradientLayer.startPoint = CGPoint.init(x: 0.2, y: 0)
        GradientLayer.endPoint = CGPoint.init(x: 1, y: 0)

        gradientLayer?.addSublayer(GradientLayer)
        gradientLayer?.mask = bgLayer;
        self.layer.addSublayer(gradientLayer!)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        
        let imageWH:CGFloat = 64
        let PointerImageView = UIImageView.init(frame: CGRect.init(x: (frame.size.width - imageWH)/2, y: (frame.size.height - imageWH)/2, width: imageWH, height: imageWH))
        PointerImageView.image = UIImage.init(named: "zhizhen")
        self .addSubview(PointerImageView)
        PointerImageView.backgroundColor = UIColor.clear
        //0 0 是左上  1 1 是右下
        PointerImageView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.8)

        for i in 0..<self.labelArray.count {
            self.creatLabel(title: self.labelArray[i], Score: CGFloat(i))
        }
        
        for i in 0...lineNum {
            self.creatLine(i: i)
        }
        
        UIView.animate(withDuration: 3) {
            
            
            
            PointerImageView.transform = CGAffineTransform.init(rotationAngle: CGFloat(CGFloat.pi * -0.5) + CGFloat(CGFloat.pi)*0.9)
            //0.9是百分比 90%
            
        }completion: { (ok) in
            
        
            UIView.animate(withDuration: 2) {
                PointerImageView.transform = CGAffineTransform.init(rotationAngle: CGFloat(CGFloat.pi * -0.5) + CGFloat(CGFloat.pi)*0.25)
            }
        }
        
        
    }
    
    
    func creatLabel(title:String,Score:CGFloat) {
        
        let  label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 23, height: 15))
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = NSTextAlignment.center
        label.text = title
        label.textColor = UIColor.black
        self .addSubview(label)
        let size = self.frame.size;
        
        //DEGREES_TO_RADIANS(angle) \((angle) / 180.0 * M_PI)
        let centerX = size.width/2 - (size.width/2 - 24)*cos(Score*CGFloat(200/self.labelArray.count)/180.0*CGFloat.pi)
        let centerY = size.width/2 - (size.width/2 - 24)*sin(Score*CGFloat(200/self.labelArray.count)/180.0*CGFloat.pi)

        label.center = CGPoint.init(x: centerX, y: centerY)
        let endAngle = Score*CGFloat(200/self.labelArray.count)-90 //这个90是斗出来的。。
        label.transform = CGAffineTransform.init(rotationAngle: (endAngle/180.0*CGFloat.pi))
        
        
        
        
    }
    
    func creatLine(i:Int)  {
        
        let 刻度 = lineNum
        let perAngle = CGFloat.pi / CGFloat(刻度)
        
        let startAngel = CGFloat(CGFloat.pi + perAngle * CGFloat(i))
        let endAngel = startAngel + perAngle/5;
        let tickPath = UIBezierPath.init(arcCenter: CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: 90, startAngle: startAngel, endAngle: endAngel, clockwise: true)
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
        
//        let LineView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 5, height: 2))
//        LineView.backgroundColor = UIColor.darkGray
//        let size = self.frame.size;
//
//        let centerX = size.width/2 - (size.width/2 - 12)*cos(CGFloat(index)*CGFloat(180/lineNum)/180.0*CGFloat.pi)
//        let centerY = size.width/2 - (size.width/2 - 12)*sin(CGFloat(index)*CGFloat(180/lineNum)/180.0*CGFloat.pi)
//        LineView.center = CGPoint.init(x: centerX, y: centerY)
//        self.addSubview(LineView)
//
//        let endAngle = CGFloat(index)*CGFloat(180/lineNum)
//        LineView.transform = CGAffineTransform.init(rotationAngle: (endAngle/180.0*CGFloat.pi))
    }
    
    
    


}
