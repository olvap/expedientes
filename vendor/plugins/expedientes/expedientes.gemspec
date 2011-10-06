$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "expedientes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "expedientes"
  s.version     = Expedientes::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Expedientes."
  s.description = "TODO: Description of Expedientes."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "mysql2"
end
