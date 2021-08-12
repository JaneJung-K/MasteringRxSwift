# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MasteringRxSwift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MasteringRxSwift
  pod 'RxSwift', '~> 5.0.0'
  pod 'RxCocoa'

  # RxSwift Community Projects
  pod 'NSObject+Rx'
  pod 'RxSwiftExt'
  pod 'Action'
  pod 'RxDataSources'
  pod "RxGesture"
  pod 'RxReachability'
  pod 'RxKeyboard'

  # Networking
  pod 'RxAlamofire'
  
  post_install do |installer| installer.pods_project.targets.each do |target| target.build_configurations.each do |config| config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0' end end end

 
end
