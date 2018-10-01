import UIKit
import VirtualViews
import ChinelaFramework
import PlaygroundSupport

struct Chinela {
    var size: Int
    var brand: String
}

struct List {
    var title: String
    var chinelas: [Chinela]
}

public struct ChinelaApp {
    var lists: [List]
    var selectedListIndex: Int?
    
    public init() {
        lists = []
        selectedListIndex = nil
    }
}

extension List {
    var tableView: TableView<ChinelaApp.Message> {
        let cells: [TableViewCell<ChinelaApp.Message>] = chinelas.enumerated().map { el in
            let (index, chinela) = el
            return TableViewCell<ChinelaApp.Message>(
                text: chinela.brand,
                onSelect: nil,
                accessory: .none,
                onDelete: nil)
        }
        return TableView<ChinelaApp.Message>(items: cells)
    }
}

extension Array where Element == List {
    var tableViewController: ViewController<ChinelaApp.Message> {
        let cells: [TableViewCell<ChinelaApp.Message>] = zip(self, self.indices).map { (el) in
            let (item, index) = el
            return TableViewCell(text: item.title,
                                 onSelect: .select(listIndex: index), onDelete: .delete(listIndex: index))
        }
        return ViewController.tableViewController(TableView(items: cells))
    }
}

extension ChinelaApp: RootComponent {
    
    public enum Message {
        case back
        case select(listIndex: Int)
        case addList
        case addChinela
        case createList(String?)
        case createItem(String?)
        case delete(listIndex: Int)
    }
    
    var selectedList: List? {
        get {
            guard let i = selectedListIndex else { return nil }
            return lists[i]
        }
        set {
            guard let i = selectedListIndex, let value = newValue else { return }
            lists[i] = value
        }
    }
    
    public var viewController: ViewController<Message> {
        let addList: BarButtonItem<Message> = BarButtonItem.system(.add, action: .addList)
        
        var viewControllers: [NavigationItem<Message>] = [
            NavigationItem(title: "ChinelaApp",
                           leftBarButtonItem: nil,
                           rightBarButtonItems: [addList],
                           viewController: lists.tableViewController)
        ]
        if let list = selectedList {
            viewControllers.append(
                NavigationItem(title: list.title,
                               rightBarButtonItems: [.system(.add, action: .addChinela)],
                               viewController: .tableViewController(list.tableView)))
        }
        return ViewController.navigationController(
            NavigationController(viewControllers: viewControllers, back: .back))
    }
    
    mutating public func send(_ msg: Message) -> [Command<Message>] {
        switch msg {
        case .addList:
            return [
                .modalTextAlert(title: "Adicionar Lista de Chinelas",
                                accept: "OK",
                                cancel: "Cancel",
                                placeholder: "Marca das suas chinelas",
                                convert: { .createList($0) })]
        case .addChinela:
            
            return [
                .modalImageTextAlert(title: "Addicinar Chinela",
                                     accept: "OKay",
                                     cancel: "Cancel",
                                     placeholder: "Marca da sua nova chinela hehe",
                                     convert: { .createItem($0) })]
            
        case .createList(let title):
            guard let title = title else { return [] }
            lists.append(List(title: title, chinelas: []))
            return []
        case .createItem(let brand):
            guard let brand = brand else { return [] }
            selectedList?.chinelas.append(Chinela(size: 10, brand: brand))
            return []
        case .select(listIndex: let index):
            selectedListIndex = index
            return []
        case .back:
            selectedListIndex = nil
            return []
        case .delete(listIndex: let index):
            lists.remove(at: index)
            return []
        }
    }
    
    public var subscriptions: [Subscription<Message>] {
        return []
    }
}

extension ChinelaApp.Message: Equatable {
    public static func ==(lhs: ChinelaApp.Message, rhs: ChinelaApp.Message) -> Bool {
        switch (lhs, rhs) {
        case (.back, .back): return true
        case (.select(let l), .select(let r)): return l == r
        default: return false
        }
    }
}

let driver = Driver(ChinelaApp())

let traits = UITraitCollection.init(traitsFrom:
    [UITraitCollection.init(preferredContentSizeCategory: UIContentSizeCategory.accessibilityMedium),
     UITraitCollection.init(layoutDirection: .leftToRight)])

PlaygroundPage.current.liveView = playgroundController(
    for: driver.viewController,
    device: Device.phone4_7inch,
    orientation: .portrait,
    traits: traits)
