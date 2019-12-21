
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stock_segments/version"

Gem::Specification.new do |spec|
  spec.name          = "stock_segments"
  spec.version       = StockSegments::VERSION
  spec.authors       = ["'Roshanak Agahi'"]
  spec.email         = ["'rosh.agahi@gmail.com'"]

  spec.summary       = %q{Review stock segment performance from CNN Business}
  spec.description   = %q{Similar stocks are grouped by category - or segment - like Healthcare, Info Tech, Real Estate, etc. This app scrapes the daily movements of the 11 segments listed on CNN Business and allows the user to dive into each segment to see the top 5 performing stocks in each segment.}
  spec.homepage      = "https://markets.money.cnn.com/Marketsdata/Sectors"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://markets.money.cnn.com/Marketsdata/Sectors'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://markets.money.cnn.com/Marketsdata/Sectors"
    spec.metadata["changelog_uri"] = "Thttps://markets.money.cnn.com/Marketsdata/Sectors"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
