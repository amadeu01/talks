import UIKit
@testable import ChinelaFramework
import VirtualViews
import PlaygroundSupport
import Charts

let months = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
let values : [Double] = [28800,
//                         32400,
//                         36000,
                         34200,
                         30000,
                         37000, 60000,
                         94000, 30000,
                         42000,
                         45000]

let r = CGRect(x: 0, y: 0, width: 600, height: 600)
var chartView = BarChartView(frame: r)

chartView.pinchZoomEnabled          = false
chartView.drawBarShadowEnabled      = false
chartView.doubleTapToZoomEnabled    = false
chartView.drawGridBackgroundEnabled = true
chartView.fitBars                   = true
//: ### BarChartDataEntry
var yVals = [BarChartDataEntry]()
for i in 0..<values.count
{
    yVals.append(BarChartDataEntry(x: Double(i), y: values[i]))
}
//: ### BarChartDataSet
var set1 = BarChartDataSet()
set1 = BarChartDataSet(values: yVals, label: "DataSet")
set1.colors = ChartColorTemplates.vordiplom()
set1.drawValuesEnabled = true

var dataSets = [ChartDataSet]()
dataSets.append(set1)
//: ### BarChartData
let data = BarChartData(dataSets: dataSets)
chartView.data = data

chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)

PlaygroundPage.current.liveView = chartView
