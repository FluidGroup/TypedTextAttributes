
Pod::Spec.new do |s|

  s.name         = "TypedTextAttributes"
  s.version      = "1.0.0"
  s.summary      = "The Library Creating Text Attributes with Type-Safety"
  s.description  = <<-DESC
The Library Creating Text Attributes with Type-Safety
It will be helpful for creating NSAttributedString.
                   DESC

  s.homepage     = "http://github.com/muukii/TypedTextAttributes"
  s.license      = "MIT"
  s.author             = { "Muukii" => "muukii.app@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/muukii/TypedTextAttributes.git", :tag => "#{s.version}" }
  s.source_files  = "TypedTextAttributes", "TypedTextAttributes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
