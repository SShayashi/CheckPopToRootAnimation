import UIKit

extension UINavigationController {
    
    @objc public func configureNavigationBar(backgroundColor: UIColor = .orange,
                                             tintColor: UIColor = .white,
                                             titleTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]) {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = backgroundColor
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            self.navigationBar.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                self.navigationBar.scrollEdgeAppearance = appearance
            }
            self.navigationBar.tintColor = tintColor
        } else {
            self.navigationBar.barStyle = .default
            self.navigationBar.barTintColor = backgroundColor
            self.navigationBar.tintColor = tintColor
            self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
}
