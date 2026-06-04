Pod::Spec.new do |s|
  s.name             = 'MoneyHashLeanTest'
  s.version          = '1.0.11'
  s.summary          = 'MoneyHash + Lean integration'
  s.description      = 'MoneyHash integration with Lean SDK using vendored xcframeworks.'

  s.homepage         = 'https://moneyhash.io'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'MoneyHash' => 'tech@moneyhash.io' }

  s.source           = { :git => 'https://github.com/MoneyHash/moneyhash-lean-pod-test.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'

  s.vendored_frameworks = [
    'LeanSDK.xcframework',
    'MoneyHashLean.xcframework'
  ]

  s.dependency 'MoneyHashCoreTest', '2.0.2'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }

  s.user_target_xcconfig = {
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }
end
