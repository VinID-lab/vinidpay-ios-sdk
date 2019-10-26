Pod::Spec.new do |s|
    s.name             = 'VinIDPaySDK'
    s.version          = '1.0'
    s.summary          = 'VinIDPay iOS SDK'
    
    s.description      = <<-DESC
    VinIDPay iOS SDK helps you handle payments with VinID iOS app.
    DESC
    
    s.homepage         = 'https://vinid.net/'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Huong Do' => 'v.huongdt71@vinid.net' }
    s.source           = { :git => 'https://github.com/VinID-lab/vinidpay-ios-sdk.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '9.0'
    s.ios.vendored_frameworks = 'Frameworks/VinIDPaySDK.framework'
end