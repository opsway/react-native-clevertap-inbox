
Pod::Spec.new do |s|
  s.name         = "RNCleverTapInbox"
  s.version      = "1.0.0"
  s.summary      = "RNCleverTapInbox"
  s.description  = <<-DESC
                  RNCleverTapInbox
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Anton Baldin" => "baldinant@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/opsway/react-native-clevertap-inbox.git", :tag => "master" }
  s.source_files  = "RNCleverTapInbox/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "CleverTap-iOS-SDK"

end

