
require_relative "lib/datagaze/version"

Gem::Specification.new do |spec|
  
  spec.name        = "datagaze"
  spec.version     = Datagaze::VERSION
  spec.license     = "MIT"

  spec.authors     = ["Jurriaan Schrofer"]
  spec.email       = ["jschrofer@gmail.com"]
  
  spec.summary     = "Take a look at your database without ever leaving your models." 
  spec.description = spec.summary

  spec.homepage                    = "https://github.com/jurriaanschrofer/datagaze"
  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = spec.homepage

  spec.files = Dir[
    "lib/**/*",
    "bin/*",
    "MIT-LICENSE", 
    "Rakefile", 
    "README.md",
    "Gemfile",
    "Gemfile.lock"
  ]

  spec.bindir       = 'bin'
  spec.executables << 'datagaze'

  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

end