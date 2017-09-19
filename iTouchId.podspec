#
# Be sure to run `pod lib lint iTouchId.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iTouchId'
  s.version          = '0.1.7'
  s.summary          = 'touch id 封装使用'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description  = <<-DESC
touch id 使用, 开发者直接通过pod方式导入，引用相关类可以直接进行验证.
DESC

  s.homepage         = 'https://github.com/zhangrongwu/iTouchId'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangrongwu' => 'zhangrongwu@ennew.cn' }
  s.source           = { :git => 'https://github.com/zhangrongwu/iTouchId.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'iTouchId/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iTouchId' => ['iTouchId/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'LocalAuthentication'
  # s.dependency 'AFNetworking', '~> 2.3'
end
