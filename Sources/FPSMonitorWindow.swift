//
//  FPSMonitorWindow.swift
//  FPSMonitor
//
//  Created by FeliksLv on 2024/2/14.
//

import UIKit

class FPSMonitorWindow: UIWindow {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.masksToBounds = true
        layer.cornerRadius = 8.0
        windowLevel = UIWindow.Level.statusBar + 1.0
        rootViewController = UIViewController()
        isUserInteractionEnabled = false
        
        addSubview(visualEffectView)
        addSubview(fpsLabel)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        visualEffectView.frame = bounds
        fpsLabel.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 18)
        fpsLabel.center = visualEffectView.center
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
    
    public func update(fps: Double) {
        fpsLabel.text = String(format: "%.1f", fps)
    }
    
    private let fpsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        if #available(iOS 13.0, *) {
            label.font = UIFont.monospacedSystemFont(ofSize: 16, weight: .regular)
        } else {
            // Fallback on earlier versions
            label.font = UIFont.systemFont(ofSize: 16)
        }
        label.text = "0.0"
        return label
    }()
    
    private lazy var visualEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView(effect: effect)
        return view
    }()
}
