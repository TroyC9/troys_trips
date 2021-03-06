require_relative 'lib/troys_trips/version'

Gem::Specification.new do |spec|
  spec.name          = "troys_trips"
  spec.version       = TroysTrips::VERSION
  spec.authors       = ["TroyC9"]
  spec.email         = ["troy.christy@icloud.com"]

  spec.summary       = %q{CLI for Hotels from TripAdvisor}
  spec.description   = %q{Provides a CLI you are able to run to see information about Hotels utilizing the TripAdvisor API}
  spec.homepage      = "https://github.com/TroyC9/troys_trips"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #spec.bindir        = "exe"
  spec.executables   = ["tt_cli"]
  spec.require_paths = ["lib"]
  spec.add_dependency "http"
  spec.add_dependency "httparty"

end
