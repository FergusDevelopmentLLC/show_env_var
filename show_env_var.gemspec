require_relative './lib/show_env_var/version'

Gem::Specification.new do |spec|
  spec.name          = "show_env_var"
  spec.version       = ShowEnvVar::VERSION
  spec.authors       = ["Will Carter"]
  spec.email         = ["will.carter@fergusllc.com"]

  spec.summary       = %q{Shows an environment var}
  spec.description   = %q{Simple application that shows an environment var}
  spec.homepage      = "https://github.com/FergusDevelopmentLLC/show_env_var"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/FergusDevelopmentLLC/show_env_var"
  spec.metadata["changelog_uri"] = "https://github.com/FergusDevelopmentLLC/show_env_var/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  # spec.bindir        = "exe"
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = "show_env_var"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.9.0"
  spec.add_development_dependency "pry", "~> 0.12.2"

  spec.add_dependency "nokogiri", "~> 1.10.7"
  spec.add_dependency "json", "~> 2.3.0"

end
