//
//  ViewController.swift
//  SwfitStoryBoard
//
//  Created by Administrator on 16/1/24.
//  Copyright © 2016年 XuYouhong. All rights reserved.
//

import UIKit

var _timelayer = CAShapeLayer()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //CAShapeLayer练习
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.frame = CGRectMake(110, 100, 150, 100)
//        shapeLayer.backgroundColor = UIColor.blackColor().CGColor
//        self.view.layer.addSublayer(shapeLayer)
        
        //指定fram
//        let path = UIBezierPath(rect: CGRectMake(110, 350, 150, 100))
        //指定圆角
//        let path = UIBezierPath(roundedRect: CGRectMake(110, 350, 150, 150), cornerRadius: 75)
        //指定起始角和半径画圆
//        let radius: CGFloat = 60.0
//        let startAngle: CGFloat = 0.0
//        let endAngle: CGFloat = CGFloat(M_PI * 1.5)
//        let path = UIBezierPath(arcCenter: self.view.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //layer添加到视图上
//        let layer = CAShapeLayer()
//        layer.path = path.CGPath
//        layer.fillColor = UIColor.redColor().CGColor
//        layer.strokeColor = UIColor.greenColor().CGColor
//        layer.strokeStart = 0.1
//        layer.strokeEnd = 0.9
//        self.view.layer.addSublayer(layer)
        
        
        /*
        *
        *画曲线
        */
        //准备三个点
        let startPoint = CGPointMake(50, 300)
        let endPoint = CGPointMake(300, 300)
        let controlPoint = CGPointMake(170, 200)
        let controlPoint2 = CGPointMake(100, 400)
        
        let layer1 = CALayer()
        layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5)
        layer1.backgroundColor = UIColor.redColor().CGColor
        
        let layer2 = CALayer()
        layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5)
        layer2.backgroundColor = UIColor.redColor().CGColor
        
        let layer3 = CALayer()
        layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5)
        layer3.backgroundColor = UIColor.redColor().CGColor
        
        //添加shapeLayer
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.moveToPoint(startPoint)
//        path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint)
        path.addCurveToPoint(endPoint, controlPoint1: controlPoint, controlPoint2: controlPoint2)
        
        layer.path = path.CGPath
        layer.fillColor = UIColor.greenColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        
        self.view.layer.addSublayer(layer)
        self.view.layer.addSublayer(layer1)
        self.view.layer.addSublayer(layer2)
        self.view.layer.addSublayer(layer3)
        
        self.animation1(layer)
//        self.animation2(layer)
        self.animation3(layer)
        layer.lineWidth = 10
        
        //创建一个UISlider
        let silder = UISlider()
        silder.frame = CGRectMake(0, 350, self.view.bounds.size.width, 20)
        silder.addTarget(self, action: Selector("silderValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(silder)
        
        //时光网Demo
        _timelayer = CAShapeLayer()
        _timelayer.path = self.timeLightDemo(0.0).CGPath
        _timelayer.fillColor = UIColor.blackColor().CGColor
        self.view.layer.addSublayer(_timelayer)
    }
    
    func silderValueChange(silder:UISlider){
        
        _timelayer.path = self.timeLightDemo(CGFloat(silder.value)).CGPath
    }
    
    private func animation1(layer: CAShapeLayer){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        layer .addAnimation(animation, forKey: "")
    }
    
    private func animation2(layer: CAShapeLayer){
        layer.strokeEnd = 0.5
        layer.strokeStart = 0.5
        
        let animation = CABasicAnimation(keyPath: "strokeStart")//
        animation.fromValue = 0.5
        animation.toValue = 0
        animation.duration = 3
        animation.repeatCount = MAXFLOAT
        
        let animation2 = CABasicAnimation(keyPath: "strokeEnd")//
        animation2.fromValue = 0.5
        animation2.toValue = 1.0
        animation2.duration = 3
        
        layer.addAnimation(animation, forKey: "")
        layer.addAnimation(animation2, forKey: "")
    }
    
    private func animation3(layer: CAShapeLayer){
        let animation = CABasicAnimation(keyPath: "lineWidth")
        animation.fromValue = 1
        animation.toValue = 10
        animation.duration = 2
        layer.addAnimation(animation, forKey: "")
    }

    private func timeLightDemo(curvature:CGFloat) -> UIBezierPath{
        
        let height:CGFloat = 100.0 * (1+curvature)
        print("~~~~~\(height)")
        let finalSize = self.view.bounds.size
        let layerHeight:CGFloat = 50 * CGFloat(1+curvature)
        let bezier = UIBezierPath()
        bezier.moveToPoint(CGPointMake(0, finalSize.height - layerHeight))
        bezier.addLineToPoint(CGPointMake(0, finalSize.height - 1))
        bezier.addLineToPoint(CGPointMake(finalSize.width, finalSize.height - 1))
        bezier.addLineToPoint(CGPointMake(finalSize.width, finalSize.height - layerHeight))
        bezier.addQuadCurveToPoint(CGPointMake(0, finalSize.height - layerHeight), controlPoint: CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - height))
        return bezier
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

