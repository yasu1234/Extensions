import UIKit

extension UIApplication {
    func getTopViewController(base: UIViewController?) -> UIViewController? {
        var viewController = base
        if base == nil {
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            viewController = window?.rootViewController
        }
        
        if let nav = viewController as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = viewController as? UITabBarController,
                  let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = viewController?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return viewController
    }
}
