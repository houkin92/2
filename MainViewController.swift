//
//  MainViewController.swift
//  地图
//
//  Created by 方瑾 on 2019/3/4.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit  //frame work  or library
import MapKit

class MainViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    //定义纬度和经度
    let latitude: CLLocationDegrees = 48.858547  //纬度
    let longitude: CLLocationDegrees = 2.294524 //精度 //CLLocationDegrees 专门用来管位置的
    //定义地图显示比例
    let xScale: CLLocationDegrees = 0.01
    let ySale: CLLocationDegrees = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //中心点
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        //定义地图缩放比例
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta:ySale, longitudeDelta: xScale)
        //显示地图范围
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        //将显示范围关联到地图上
        mapView.setRegion(region, animated: true)
        //设置地图显示样式
        mapView.mapType = .satellite//卫星图      。standard  这个是标准的地图
//        //定义大头针
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        //添加大头针的标题
//        annotation.title = "巴黎铁塔"
//        //添加大头针的副标题
//        annotation.subtitle = "埃菲尔铁塔"
//        //将大头针添加到地图上
//        mapView.addAnnotation(annotation)
    }
    
    @IBAction func addAnnotation(_ sender: UILongPressGestureRecognizer) {
        //定义大头针
        let annotation = MKPointAnnotation()
        //获取被长按的屏幕位置
        let touchPoint = sender.location(in: mapView )
        //获取点击位置真实坐标
        let touchLocation: CLLocationCoordinate2D = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        //表示从哪里下载toCoordinateFrom: mapView       vconvert(touchPoint表示转换，从触碰到的那个点获取位置信息
        //给大头针添加坐标
        annotation.coordinate = touchLocation
        //将大头针添加到地图上
        mapView.addAnnotation(annotation)
    }
    
    
    
}

