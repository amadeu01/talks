//
//  BarChartsViewController.swift
//  ChinelaFramework
//
//  Created by Amadeu Cavalcante Filho on 01/10/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

import UIKit
import Charts
import SnapKit

class BarChartViewController: UIViewController {
    
    let chartView: BarChartView
    public var values : [Double] = [28800, 32400, 36000, 34000, 30000, 42000, 45000]
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let r = CGRect(x: 0, y: 0, width: 300, height: 400)
        chartView = BarChartView(frame: r)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bar Chart"
        let view = UIView()
        
        setupChart()
        
        view.addSubview(chartView)
        
        self.view = view
        
        updateConstraint()
    }
    
    func setupChart() {
        chartView.pinchZoomEnabled          = false
        chartView.drawBarShadowEnabled      = false
        chartView.doubleTapToZoomEnabled    = false
        chartView.drawGridBackgroundEnabled = true
        chartView.fitBars                   = true
        
        var yVals = [BarChartDataEntry]()
        for i in 0..<values.count {
            yVals.append(BarChartDataEntry(x: Double(i), y: values[i]))
        }
        //: ### BarChartDataSet
        var set1 = BarChartDataSet()
        set1 = BarChartDataSet(values: yVals, label: "DataSet")
        set1.colors = ChartColorTemplates.vordiplom()
        set1.drawValuesEnabled = true
        
        var dataSets = [ChartDataSet]()
        dataSets.append(set1)
        
        let data = BarChartData(dataSets: dataSets)
        chartView.data = data
        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
    }
    
    func updateConstraint() {
        chartView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.top.equalTo(view.snp.top).offset(20.0)
            make.bottom.equalTo(view.snp.bottom).offset(20.0)
            make.right.equalTo(view.snp.right).offset(-20.0)
            make.left.equalTo(view.snp.left).offset(20.0)
        }
    }
}
