# -*- encoding: utf-8 -*-
# stub: twitter 8.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "twitter".freeze
  s.version = "8.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "bug_tracker_uri" => "https://github.com/sferik/twitter-ruby/issues", "changelog_uri" => "https://github.com/sferik/twitter-ruby/blob/master/CHANGELOG.md", "documentation_uri" => "https://rubydoc.info/gems/twitter/", "funding_uri" => "https://github.com/sponsors/sferik/", "homepage_uri" => "https://sferik.github.io/twitter/", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/sferik/twitter-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Erik Berlin".freeze, "John Nunemaker".freeze, "Wynn Netherland".freeze, "Steve Richert".freeze, "Steve Agalloco".freeze]
  s.date = "1980-01-02"
  s.description = "A Ruby interface to the Twitter API.".freeze
  s.email = ["sferik@gmail.com".freeze]
  s.homepage = "https://sferik.github.io/twitter/".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "The `twitter` gem is deprecated and no longer maintained. Use the `x` gem instead.".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 3.2".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A Ruby interface to the Twitter API.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.8"])
  s.add_runtime_dependency(%q<buftok>.freeze, ["~> 0.3.0"])
  s.add_runtime_dependency(%q<equalizer>.freeze, ["~> 0.0.11"])
  s.add_runtime_dependency(%q<http>.freeze, ["~> 5.2"])
  s.add_runtime_dependency(%q<http-form_data>.freeze, ["~> 2.3"])
  s.add_runtime_dependency(%q<llhttp-ffi>.freeze, ["~> 0.5.0"])
  s.add_runtime_dependency(%q<memoizable>.freeze, ["~> 0.4.0"])
  s.add_runtime_dependency(%q<multipart-post>.freeze, ["~> 2.4"])
  s.add_runtime_dependency(%q<naught>.freeze, ["~> 1.1"])
  s.add_runtime_dependency(%q<simple_oauth>.freeze, ["~> 0.3.0"])
end
