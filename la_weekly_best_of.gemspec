
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "la_weekly_best_of/version"

Gem::Specification.new do |spec|
  spec.name          = "la_weekly_best_of"
  spec.version       = LaWeeklyBestOf::VERSION
  spec.authors       = "Iron Viral Media, Jay Bednar"
  spec.email         = "IronViralMedia@gmail.com"

  spec.summary       = %q{CLI gem for exploring the LA Weekly Best Of LA.}
  spec.description   = %q{CLI gem to explore LA Weekly Best Of LA 2017 Winners by Neighborhood or Category}
  spec.homepage      = "https://github.com/jaybednar/la-weekly-best-of-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/jaybednar/la-weekly-best-of-cli-app"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
