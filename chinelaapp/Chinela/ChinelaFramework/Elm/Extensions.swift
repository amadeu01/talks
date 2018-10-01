//
//  Extensions.swift
//  ChinelaFramework
//
//  Created by Amadeu Cavalcante Filho on 01/10/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

extension UIViewController {
    func modalTextAlert(title: String, accept: String = .ok, cancel: String = .cancel, placeholder: String = "", callback: @escaping (String?) -> ()) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = placeholder }
        alert.addAction(UIAlertAction(title: cancel, style: .cancel) { _ in
            callback(nil)
        })
        alert.addAction(UIAlertAction(title: accept, style: .default) { _ in
            callback(alert.textFields?.first?.text)
        })
        let vc = self.presentedViewController ?? self
        vc.present(alert, animated: true)
    }
    
    func modalImageTextAlert(title: String, accept: String = .ok, cancel: String = .cancel,
                             placeholder: String = "", callback: @escaping (String?) -> ()) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = placeholder }
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        let bundle = Bundle(for: RootClass.self)
        
        let image = UIImage(named: "chinela_ceara", in: bundle, compatibleWith: nil)
        
        imageView.image = image
        alert.view.addSubview(imageView)
        
        alert.addAction(UIAlertAction(title: cancel, style: .cancel) { _ in
            callback(nil)
        })
        alert.addAction(UIAlertAction(title: accept, style: .default) { _ in
            callback(alert.textFields?.first?.text)
        })
        let vc = self.presentedViewController ?? self
        vc.present(alert, animated: true)
    }
    
    func modalCustom(alert: UIAlertController, animated: Bool = true, callback: @escaping (String?) -> ()) {
        alert.addAction(UIAlertAction(title: .cancel, style: .cancel) { _ in
            callback(nil)
        })
        alert.addAction(UIAlertAction(title: .ok, style: .default) { _ in
            callback(alert.textFields?.first?.text)
        })
        
        let vc = self.presentedViewController ?? self
        vc.present(alert, animated: animated)
    }
}
