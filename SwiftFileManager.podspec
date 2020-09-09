Pod::Spec.new do |s|
s.name = 'SwiftFileManager'
s.version = '0.0.1'
s.license = { :type => "MIT", :file => "LICENSE" }
s.summary = 'you can use this lib to look all of the files in sandbox'
s.homepage = 'https://github.com/devzhr/SwiftFileManager'
s.authors = { 'devzhr' => 'zouhair.mouhsine@gmail.com' }
s.source = { :git => 'https://github.com/devzhr/SwiftFileManager.git', :tag => s.version }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'SwiftFileManager/Classes/**/*.swift'
s.resource     = 'SwiftFileManager/Classes/image/WXXImage.bundle'
s.description  = <<-DESC
                  you can use this lib to look all of the files in sandbox,
                  of course
                   DESC
 s.framework    = "UIKit","Foundation"
end
