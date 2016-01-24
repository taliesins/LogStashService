Gem::Specification.new do |s|
  s.name = 'logstash-output-elasticsearch_http'
  s.version         = '2.0.2'
  s.licenses = ['Apache License (2.0)']
  s.summary = "The elasticsearch_http output is deprecated in favor of the elasticsearch"
  s.description = "The elasticsearch_http output is deprecated in favor of the elasticsearch output with the protocol set to http"
  s.authors = ["Elastic"]
  s.email = 'info@elastic.co'
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "output" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", ">= 2.0.0.beta2", "< 3.0.0"
  s.add_runtime_dependency 'logstash-output-elasticsearch'
  s.add_runtime_dependency 'logstash-codec-plain'
  s.add_development_dependency 'logstash-devutils'
end
