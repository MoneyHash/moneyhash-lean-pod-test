Pod::Spec.new do |s|
  s.name             = 'MoneyHashLeanTest'
  s.version          = '1.0.9'
  s.summary          = 'MoneyHash + Lean integration'
  s.description      = 'MoneyHash integration with Lean SDK using vendored xcframeworks.'

  s.homepage         = 'https://moneyhash.io'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'MoneyHash' => 'tech@moneyhash.io' }

  # Required even for local pods
  s.source           = { :path => '.' }

  s.ios.deployment_target = '14.0'

  s.vendored_frameworks = [
    'LeanSDK.xcframework',
    'MoneyHashLean.xcframework'
  ]

  s.dependency 'MoneyHashCoreTest', '2.0.1'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }

  s.user_target_xcconfig = {
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }
end
