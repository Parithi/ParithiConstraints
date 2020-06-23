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
    
    public func setLeftToLeft(of parent: UIView, offset value: CGFloat = 0.0) {
        self.leadingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leadingAnchor, constant: value).isActive = true
    }
    
    public func setRightToRight(of parent: UIView, offset value: CGFloat = 0.0) {
        self.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -value).isActive = true
    }
    
    public func setTopToTop(of parent: UIView, offset value: CGFloat = 0.0) {
        self.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: value).isActive = true
    }
    
    public func setTopToBottom(of parent: UIView, offset value: CGFloat = 0.0) {
        self.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: value).isActive = true
    }
    
    public func setBottomToBottom(of parent: UIView, offset value: CGFloat = 0.0) {
        self.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -value).isActive = true
    }
    
    public func setBottomToTop(of parent: UIView, offset value: CGFloat = 0.0) {
        self.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: -value).isActive = true
    }
    
    public func pinToCorners(of view: UIView) {
        self.setTopToTop(of: view)
        self.setBottomToBottom(of: view)
        self.setRightToRight(of: view)
        self.setLeftToLeft(of: view)
    }
    
    public func setToCenter(of view: UIView) {
        alignVertically(to: view)
        alignHorizontally(to: view)
    }
    
    public func alignVertically(to view: UIView) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    public func alignHorizontally(to view: UIView) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
