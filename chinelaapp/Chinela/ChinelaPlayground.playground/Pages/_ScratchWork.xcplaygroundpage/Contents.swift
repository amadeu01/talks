import UIKit
@testable import ChinelaFramework
import VirtualViews
import PlaygroundSupport


//let viewController = ConstraintsExample()
let viewController = BarChartViewController()


// viewController.values.append(3000)
//
//viewController.values.append(8000)
//
//viewController.values.append(11000)
//viewController.values.append(110000)

let traits = UITraitCollection.init(traitsFrom:
    [UITraitCollection.init(preferredContentSizeCategory: UIContentSizeCategory.accessibilityMedium),
     UITraitCollection.init(layoutDirection: .leftToRight)])

PlaygroundPage.current.liveView = playgroundController(
    for: viewController,
    device: Device.phone4_7inch,
    orientation: .landscape,
    traits: traits)

