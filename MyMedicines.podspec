Pod::Spec.new do |spec|

  spec.name         = "MyMedicines"
  spec.version      = "0.0.1"
  spec.summary      = "Biblioteca de consulta de remédios"

  spec.description  = <<-DESC
  Biblioteca para facilitar o processo de consulta de remédios na base de dados centralizada.
                   DESC

  spec.homepage     = "https://github.com/jefnazario/MyMedicines.iOS"

  spec.license      = { :type => "MIT", :file => "https://github.com/jefnazario/MyMedicines.iOS/blob/master/LICENSE" }

  spec.author             = { "Jeferson F. Nazario" => "jefnazario@gmail.com" }
  spec.social_media_url   = "https://twitter.com/jefnazario"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/jefnazario/MyMedicines.iOS.git", :tag => "#{spec.version}" }
  spec.swift_version = "4.2"


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "MyMedicines/MyMedicines/**/*.{h,m,swift,framework}"
end
