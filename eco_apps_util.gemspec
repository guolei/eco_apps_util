spec = Gem::Specification.new do |s| 
  s.name = "eco_apps_util"
  s.version = "0.2.0"
  s.author = "Lei Guo"
  s.email = "guolei@eleutian.com"
  s.homepage = "http://gems.eleutian.com/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Lib for eleutian platform"
  %w{lib}.each{|folder|
    s.files += Dir["#{folder}/**/*"]
  }
  s.require_path = "lib"
  s.autorequire = "eco_apps_util"
  s.test_files = Dir["spec/**/*"]
  s.extra_rdoc_files = ["README.rdoc"]
end
