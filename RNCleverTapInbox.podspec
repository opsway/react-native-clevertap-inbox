require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = 'RNCleverTapInbox'
  s.version      = package['version']
  s.description  = package['description']
  s.summary      = package['description']
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.author       = { 'Anton Baldin' => 'baldinant@gmail.com' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/opsway/react-native-clevertap-inbox.git', :tag => s.version }
  s.source_files  = 'ios/**/*.{h,m}'

  s.dependency 'React'
  s.dependency 'CleverTap-iOS-SDK', '>= 3.4.0'

end
