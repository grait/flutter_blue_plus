#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_blue_plus.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_blue_plus'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin for connecting and communicationg with Bluetooth Low Energy devices, on Android and iOS'
  s.description      = <<-DESC
Flutter plugin for connecting and communicationg with Bluetooth Low Energy devices, on Android and iOS
                       DESC
  s.homepage         = 'https://github.com/boskokg/flutter_blue_plus'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Bosko Popovic' => 'boskokg@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*', 'gen/**/*'
  s.public_header_files = 'Classes/**/*.h', 'gen/**/*.h'
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.13'
  s.framework = 'CoreBluetooth'

  s.subspec "Protos" do |ss|
    ss.source_files = "gen/*.pbobjc.{h,m}", "gen/**/*.pbobjc.{h,m}"
    ss.header_mappings_dir = "gen"
    ss.requires_arc = false
    ss.dependency "Protobuf", '~> 3.11.3'
  end

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'GCC_PREPROCESSOR_DEFINITIONS' => 'GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
  }
end
