import PlaygroundSupport
@testable import ChinelaFramework

PlaygroundPage.current.needsIndefiniteExecution = true

let driver = Driver(GifApp())

let traits = UITraitCollection.init(traitsFrom:
    [UITraitCollection.init(preferredContentSizeCategory: UIContentSizeCategory.accessibilityMedium),
     UITraitCollection.init(layoutDirection: .leftToRight)])

PlaygroundPage.current.liveView = playgroundController(
    for: driver.viewController,
    device: Device.phone4_7inch,
    orientation: .portrait,
    traits: traits)
