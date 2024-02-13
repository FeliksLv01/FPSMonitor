//
//  FPSMonitor.swift
//  FPSMonitor
//
//  Created by FeliksLv on 2024/2/14.
//

import QuartzCore
import UIKit

@objc
public class FPSMonitor: NSObject {
    @objc public static let shared = FPSMonitor()
    
    private var startTimestamp: TimeInterval = 0.0
    private var count = 0
    
    private lazy var fpsWindow: FPSMonitorWindow = {
        var topInset: CGFloat = 20.0
        return FPSMonitorWindow(frame: CGRect(x: UIScreen.main.bounds.width - 16.0 - 100.0, y: topInset, width: 100, height: 40))
    }()
    
    private lazy var displayLink: CADisplayLink = {
        let displayLink = CADisplayLink(target: self, selector: #selector(displayLinkAction(displayLink:)))
        displayLink.isPaused = true
        displayLink.add(to: .current, forMode: .common)
        return displayLink
    }()
    
    @objc private func displayLinkAction(displayLink: CADisplayLink) {
        let now = Date().timeIntervalSince1970
        if startTimestamp < 1.0 {
            startTimestamp = now
            return
        }
        
        count += 1
        let interval = now - startTimestamp
        if interval >= 1 {
            let fps = Double(count) / interval
            fpsWindow.update(fps: fps)
            startTimestamp = now
            count = 0
        }
    }
    
    @objc public func start() {
        fpsWindow.makeKeyAndVisible()
        startTimestamp = Date().timeIntervalSince1970
        displayLink.isPaused = false
    }
    
    @objc public func stop() {
        displayLink.isPaused = true
        startTimestamp = 0.0
        count = 0
    }
}
