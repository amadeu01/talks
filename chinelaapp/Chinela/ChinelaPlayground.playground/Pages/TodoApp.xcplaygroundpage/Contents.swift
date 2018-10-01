import PlaygroundSupport
@testable import ChinelaFramework

let driver = Driver(TodosApp())

let traits = UITraitCollection.init(traitsFrom:
    [UITraitCollection.init(preferredContentSizeCategory: UIContentSizeCategory.accessibilityMedium),
     UITraitCollection.init(layoutDirection: .leftToRight)])
    
PlaygroundPage.current.liveView = playgroundController(
    for: driver.viewController,
    device: Device.phone4_7inch,
    orientation: .portrait,
    traits: traits)
