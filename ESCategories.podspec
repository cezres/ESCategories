Pod::Spec.new do |s|

s.name         = 'ESCategories'
s.version      = '0.2.1'
s.summary      = 'D2C iOS拓展分类.'
s.homepage     = 'https://github.com/cezres/ESCategories'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { 'cezres' => 'cezres@163.com' }

s.platform     = :ios, '7.0'
s.source       = { :git => 'https://github.com/cezres/ESCategories.git', :tag => s.version }
s.source_files = 'ESCategories/**/*.{h,m}'
s.requires_arc = true
s.public_header_files = 'ESCategories/**/*.h'


s.default_subspec = 'Categories'

s.subspec 'Categories' do |c|
    c.source_files = "ESCategories/ESCategories.h"

    c.dependency "ESCategories/Macros"
    c.dependency "ESCategories/Foundation"
    c.dependency "ESCategories/UIKit"

end


#### Macros ####

s.subspec 'Macros' do |m|
    m.source_files = "ESCategories/Macros/**/*.{h,m}"
end

#### Foundation ####

s.subspec 'Foundation' do |f|
    f.source_files = "ESCategories/Foundation/Foundation_Categories.h"

    f.dependency "ESCategories/NSDictionary"
    f.dependency "ESCategories/NSObject"
    f.dependency "ESCategories/NSString"
end

    s.subspec 'NSDictionary' do |dict|
        dict.source_files = "ESCategories/Foundation/NSDictionary/*.{h,m}"
    end

    s.subspec 'NSObject' do |obj|
        obj.source_files = "ESCategories/Foundation/NSObject/*.{h,m}"
    end

    s.subspec 'NSString' do |str|
        str.source_files = "ESCategories/Foundation/NSString/*.{h,m}"
    end



#### UIKit ####

s.subspec 'UIKit' do |u|
    u.source_files = "ESCategories/UIKit/**/*.{h,m}"
end



end

