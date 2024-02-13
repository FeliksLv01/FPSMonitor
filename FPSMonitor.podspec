Pod::Spec.new do |s|
  s.name             = 'FPSMonitor'
  s.version          = '0.0.1'
  s.summary          = 'A short description of FPSMonitor.'
  s.homepage         = 'https://github.com/FeliksLv01/FPSMonitor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FeliksLv' => 'felikslv@163.com' }
  s.source           = { :git => 'https://github.com/FeliksLv01/FPSMonitor.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  
  s.prefix_header_file = false
  s.source_files = [
    'Sources/**/*.{swift,h,m,mm}'
  ]

  s.frameworks = 'UIKit'
end
