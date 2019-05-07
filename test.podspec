Pod::Spec.new do |s|
  s.name         = "ANTest"
  s.version      = "1.0.0"
  s.summary      = "A iOS LaunchAd show of MyPodDemo."
  s.homepage     = "https://github.com/StoneSomebo/Test"
  s.license      = "MIT"
  s.author       = { "anttoo" => "anttoo@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/StoneSomebo/Test.git", :tag => "1.0.0" }
  s.source_files = "ANTest/*.{h,m}"
  s.frameworks   = "UIKit", "Foundation"
  s.requires_arc = true
  s.xcconfig     = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
 end