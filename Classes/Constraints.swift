import UIKit

extension UIView {
    
    public func addView(_ view : UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func addConstraintsWithFormat(format : String, views : UIView...) {
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    public func matchWidth(with view: UIView, multiplier : CGFloat = 1.0) {
        self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
    }
    
    public func matchHeight(with view: UIView, multiplier : CGFloat = 1.0) {
        self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
    }
    
    public func setSize(size: CGSize) {
        setWidth(to: size.width)
        setHeight(to: size.height)
    }
    
    public func setWidth(to value: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: value).isActive = true
    }
    
    public func setHeight(to value: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: value).isActive = true
    }
    
    public func setLeftToLeft(of parent: UIView, offset value: CGFloat = 0.0, useSafeLayout : Bool = false) {
        let parentAnchor = useSafeLayout ? parent.safeAreaLayoutGuide.leadingAnchor : parent.leadingAnchor
        self.leadingAnchor.constraint(equalTo: parentAnchor, constant: value).isActive = true
    }
    
    public func setRightToRight(of parent: UIView, offset value: CGFloat = 0.0, useSafeLayout : Bool = false) {
        let parentAnchor = useSafeLayout ? parent.safeAreaLayoutGuide.trailingAnchor : parent.trailingAnchor
        self.trailingAnchor.constraint(equalTo: parentAnchor, constant: -value).isActive = true
    }
    
    public func setTopToTop(of parent: UIView, offset value: CGFloat = 0.0, useSafeLayout : Bool = false) {
        let parentAnchor = useSafeLayout ? parent.safeAreaLayoutGuide.topAnchor : parent.topAnchor
        self.topAnchor.constraint(equalTo: parentAnchor, constant: value).isActive = true
    }
    
    public func setTopToBottom(of parent: UIView, offset value: CGFloat = 0.0, useSafeLayout : Bool = false) {
        let parentAnchor = useSafeLayout ? parent.safeAreaLayoutGuide.bottomAnchor : parent.bottomAnchor
        self.topAnchor.constraint(equalTo: parentAnchor, constant: value).isActive = true
    }
    
    public func setBottomToBottom(of parent: UIView, offset value: CGFloat = 0.0, useSafeLayout : Bool = false) {
        let parentAnchor = useSafeLayout ? parent.safeAreaLayoutGuide.bottomAnchor : parent.bottomAnchor
        self.bottomAnchor.constraint(equalTo: parentAnchor, constant: -value).isActive = true
    }
    
    public func setBottomToTop(of parent: UIView, offset value: CGFloat = 0.0, useSafeLayout : Bool = false) {
        let parentAnchor = useSafeLayout ? parent.safeAreaLayoutGuide.topAnchor : parent.topAnchor
        self.bottomAnchor.constraint(equalTo: parentAnchor, constant: -value).isActive = true
    }
    
    public func setLeftToRight(of parent: UIView, offset value: CGFloat = 0.0, useSafeLayout : Bool = false) {
        let parentAnchor = useSafeLayout ? parent.safeAreaLayoutGuide.rightAnchor : parent.rightAnchor
        self.leftAnchor.constraint(equalTo: parentAnchor, constant: value).isActive = true
    }
    
    public func setRightToLeft(of parent: UIView, offset value: CGFloat = 0.0, useSafeLayout : Bool = false) {
        let parentAnchor = useSafeLayout ? parent.safeAreaLayoutGuide.leftAnchor : parent.leftAnchor
        self.rightAnchor.constraint(equalTo: parentAnchor, constant: value).isActive = true
    }
    
    public func pinToCorners(of view: UIView, useSafeLayout : Bool = false) {
        self.setTopToTop(of: view, useSafeLayout: useSafeLayout)
        self.setBottomToBottom(of: view, useSafeLayout: useSafeLayout)
        self.setRightToRight(of: view, useSafeLayout: useSafeLayout)
        self.setLeftToLeft(of: view, useSafeLayout: useSafeLayout)
    }
    
    public func setToCenter(of view: UIView) {
        alignVertically(to: view)
        alignHorizontally(to: view)
    }
    
    public func alignVertically(to view: UIView, offset value: CGFloat = 0.0) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: value).isActive = true
    }
    
    public func alignHorizontally(to view: UIView, offset value: CGFloat = 0.0) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: value).isActive = true
    }
        
}
