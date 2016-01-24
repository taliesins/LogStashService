Gem::Specification.new do |s|

  s.name            = 'logstash-input-zenoss'
  s.version         = '2.0.2'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "Read Zenoss events from the zenoss.zenevents fanout exchange."
  s.description     = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors         = ["Elastic"]
  s.email           = 'info@elastic.co'
  s.homepage        = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "input" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", ">= 2.0.0.beta2", "< 3.0.0"

  s.add_runtime_dependency 'beefcake'
  s.add_runtime_dependency 'logstash-input-rabbitmq'

  # enforce pre 2.0 bunny and amq-protocol versions since both are now
  # exclusive for Ruby 2.0+ (and only JRuby 9.0.0.0 is > 1.9)
  s.add_runtime_dependency 'bunny', '< 2.0.0'
  s.add_runtime_dependency 'amq-protocol', '< 2.0.0'

  s.add_development_dependency 'logstash-devutils'
end
