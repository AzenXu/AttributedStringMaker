Pod::Spec.new do |s|
  s.name         = "AttributedStringMaker"
  s.version      = "0.0.1"
  s.summary      = "A tool to generate attributed string comfortable."
  s.homepage     = "https://github.com/AzenXu/AttributedStringMaker"
  s.license      = "MIT"
  s.author             = { "XuAzen" => "azen.cell@foxmail.com" }
  s.source       = { :git => "https://github.com/AzenXu/AttributedStringMaker.git", :tag => "#{s.version}" }
  s.source_files  = "AttributeStringMaker/**/*.{swift}"
  s.framework  = "UIKit"
end
