//
//  CustomImageView.swift
//  TODO
//
//  Created by Lucas da Silva Reis on 19/10/23.
//

import UIKit

class CustomImageView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    
    
    private func commonInit() {
        view = loadViewFromNib(nibName: "CustomImageView")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        addSubview(view)
    }
    
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    
    
}
