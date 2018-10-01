import UIKit
@testable import ChinelaFramework
import VirtualViews
import PlaygroundSupport
import SnapKit



let viewController = BasicUIScrollViewController()

PlaygroundPage.current.liveView = playgroundController(
    for: viewController,
    device: Device.phone4_7inch,
    orientation: .portrait)
