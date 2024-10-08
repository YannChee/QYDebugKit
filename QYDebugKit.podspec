#
# Be sure to run `pod lib lint QYDebugKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QYDebugKit'
  s.version          = '0.1.1'
  s.summary          = 'Custom print an iOS app logs to the screen'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/YannChee/QYDebugKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YannChee' => 'yannchee@163.com' }
  s.source           = { :git => 'https://github.com/YannChee/QYDebugKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'QYDebugKit/Classes/**/*'
  
   s.resource_bundles = {
     'QYDebugKit' => ['QYDebugKit/Assets/*.{xib,png,json}']
   }
  

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # 指定 FLEX 和 YYModel 只在 Debug 配置下有效
  s.dependency 'FLEX', :configurations => ['Debug']
  s.dependency 'YYModel', :configurations => ['Debug']
  
end
