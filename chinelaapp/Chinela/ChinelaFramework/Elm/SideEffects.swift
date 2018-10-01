//
//  SideEffects.swift
//  ChinelaFramework
//

import UIKit
import VirtualViews

public enum Subscription<Message: Equatable> {
    case timer(interval: TimeInterval, message: Message)
}

extension Subscription: Equatable {
    public static func ==(lhs: Subscription, rhs: Subscription) -> Bool {
        switch (lhs, rhs) {
        case let (.timer(interval, message), .timer(interval1, message1)):
            return interval == interval1 && message == message1
        }
    }
}

extension Subscription {
    public func map<B>(_ transform: @escaping (Message) -> B) -> Subscription<B> {
        switch self {
        case let .timer(interval: interval, message: message):
            return .timer(interval: interval, message: transform(message))
        }
    }
}

public enum Command<A: Equatable> {
    // Custom
    case modalCustom(alert: UIAlertController, convert: (String?) -> A)
    
    // ViewControllers
    case modalTextAlert(title: String, accept: String, cancel: String, placeholder: String, convert: (String?) -> A)
    case modalImageTextAlert(title: String, accept: String, cancel: String, placeholder: String, convert: (String?) -> A)
    case modalAlert(title: String, accept: String)
    
    // Networking
    case request(URLRequest, available: (Data?) -> A)
    
    public func map<B>(_ f: @escaping (A) -> B) -> Command<B> {
        switch self {
        case let .modalTextAlert(title, accept, cancel, placeholder, convert):
            return .modalTextAlert(title: title, accept: accept, cancel: cancel, placeholder: placeholder, convert: { f(convert($0)) })
        case let .modalAlert(title: title, accept: accept):
            return .modalAlert(title: title, accept: accept)
        case let .request(request, available):
            return .request(request, available: { result in f(available(result))})
        case .modalImageTextAlert(let title, let accept, let cancel, let placeholder, let convert):
            return .modalImageTextAlert(title: title, accept: accept, cancel: cancel, placeholder: placeholder, convert: { f(convert($0)) })
        
        case .modalCustom(let alert, let convert):
            return .modalCustom(alert: alert, convert: { f(convert($0)) })
        }
    }
}

extension Command {
    func interpret(viewController: UIViewController!, callback: @escaping (A) -> ()) {
        switch self {
        case let .modalTextAlert(title: title, accept: accept, cancel: cancel, placeholder: placeholder, convert: convert):
            viewController.modalTextAlert(title: title, accept: accept, cancel: cancel, placeholder: placeholder, callback: { str in
                callback(convert(str))
            })
        case let .modalAlert(title: title, accept: accept):
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: accept, style: .default, handler: nil))
            let vc: UIViewController = viewController.presentedViewController ?? viewController
            vc.present(alert, animated: true, completion: nil)
        case let .request(request, available: available):
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                callback(available(data))
                }.resume()
        case .modalImageTextAlert(let title, let accept, let cancel, let placeholder, let convert):
            viewController.modalImageTextAlert(title: title, accept: accept,
                                               cancel: cancel, placeholder: placeholder, callback: { str in
                callback(convert(str))
            })
        case .modalCustom(let alert, let convert):
            viewController.modalCustom(alert: alert, callback: { str in
                callback(convert(str))
            })
        }
    }
}

final class SubscriptionManager<Message: Equatable> {
    var callback: (Message) -> ()
    var timers: [Timer] = []
    
    init(_ callback: @escaping (Message) -> ()) {
        self.callback = callback
    }
    
    func update(subscriptions: [Subscription<Message>]) {
        var newTimers: [Timer] = []
        var oldTimers = timers
        for subscription in subscriptions {
            switch subscription {
            case let .timer(interval: interval, message: message):
                if let index = oldTimers.index(where: { ($0.userInfo as? Subscription) == subscription }) {
                    let timer: Timer = oldTimers.remove(at: index)
                    newTimers.append(timer)
                } else {
                    newTimers.append(Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { [unowned self] _ in
                        self.callback(message)
                    }))
                }
            }
        }
        for old in oldTimers {
            old.invalidate()
        }
        timers = newTimers
        
    }
}

extension String {
    static let ok = NSLocalizedString("OK", comment: "")
    static let cancel = NSLocalizedString("Cancel", comment: "")
}
