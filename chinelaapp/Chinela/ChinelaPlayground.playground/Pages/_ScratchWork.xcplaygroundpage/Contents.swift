import UIKit
@testable import ChinelaFramework
import VirtualViews
import PlaygroundSupport
import Charts
import SnapKit

class BasicUIScroll: UIViewController {
    
    var didSetupConstraints = false
    
    let scrollView  = UIScrollView()
    let contentView = UIView()
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        label.textColor = .white
        label.text = NSLocalizedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", comment: "")
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        
        contentView.backgroundColor = UIColor.lightGray
        scrollView.addSubview(contentView)
        contentView.addSubview(label)
        
        self.view = view
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            scrollView.snp.makeConstraints { make in
                make.edges.equalTo(view).inset(UIEdgeInsets.zero)
            }
            
            contentView.snp.makeConstraints { make in
                make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
                make.width.equalTo(scrollView)
            }
            
            label.snp.makeConstraints { make in
                make.top.equalTo(contentView).inset(20)
                make.leading.equalTo(contentView).inset(120)
                make.trailing.equalTo(contentView).inset(20)
                make.bottom.equalTo(contentView).inset(20)
            }
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}

//let viewController = ConstraintsExample()
let viewController = BasicUIScroll()


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

