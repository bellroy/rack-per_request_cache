Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to?(:specification_version=)
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to?(:required_rubygems_version=)

  s.name    = "rack-per_request_cache"
  s.version = "1.0.0"
  s.date    = "2011-11-16"

  s.description = "Module for caching arbitrary objects / constructs during a request."
  s.summary     = "Module for caching arbitrary objects / constructs during a request."

  s.authors  = ["Tom Sommer"]
  s.email    = "tom@trikeapps.com"
  s.homepage = "https://github.com/tricycle/rack-per_request_cache"

  s.files = %w[
    README.md
    lib/rack/per_request_cache.rb
    spec/per_request_cache_spec.rb
  ]
  s.test_files       = s.files.select { |path| path =~ /^spec\/.*_spec.rb/ }

  s.add_dependency 'rack', '>= 1.0'
  s.add_development_dependency 'rspec', '>= 2.0'

  s.require_paths    = %w[lib]
  s.rubygems_version = "1.8.10"
end
