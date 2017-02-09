Pod::Spec.new do |s|

s.name         = 'ESCategories'
s.version      = '0.2.3'
s.summary      = 'D2C iOS拓展分类.'
s.homepage     = 'https://github.com/cezres/ESCategories'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { 'cezres' => 'cezres@163.com' }

s.platform     = :ios, '7.0'
s.source       = { :git => 'https://github.com/cezres/ESCategories.git', :tag => s.version }
s.source_files = 'ESCategories/**/*.{h,m}'
s.requires_arc = true
s.public_header_files = 'ESCategories/**/*.h'



end

