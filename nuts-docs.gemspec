require_relative 'lib/nuts/docs/version'

Gem::Specification.new do |spec|
  spec.name          = "nuts-docs"
  spec.version       = Nuts::Docs::VERSION
  spec.authors       = [ "Robin Doer" ]
  spec.email         = [ "robin@robind.de" ]

  spec.summary       = %q{Documentation generators for nuts projects.}
  spec.homepage      = "https://github.com/drobin/nuts-docs"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/drobin/nuts-docs"
  spec.metadata["changelog_uri"] = "https://github.com/drobin/nuts-docs/CHANGELOG.md"

  spec.add_runtime_dependency 'nokogiri', '~> 1.10.9'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
