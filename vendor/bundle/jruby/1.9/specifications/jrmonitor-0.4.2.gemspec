# -*- encoding: utf-8 -*-
# stub: jrmonitor 0.4.2 ruby lib jruby-ext

Gem::Specification.new do |s|
  s.name = "jrmonitor"
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib", "jruby-ext"]
  s.authors = ["Elastic"]
  s.bindir = "exe"
  s.date = "2016-05-24"
  s.description = "This gems allows you to access in a Ruby friendly way the internal JVM monitoring tools for things like System, Threads and Memory information"
  s.email = ["info@elastic.co"]
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.licenses = ["Apache License (2.0)"]
  s.rubygems_version = "2.4.8"
  s.summary = "JVM Platform MXBeans wrapper used for monitoring."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.10"])
      s.add_development_dependency(%q<pry>, ["~> 0.10.1"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.10"])
      s.add_dependency(%q<pry>, ["~> 0.10.1"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.10"])
    s.add_dependency(%q<pry>, ["~> 0.10.1"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
