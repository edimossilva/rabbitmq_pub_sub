require_relative 'lib/rabbitmq_pub_sub/version'

Gem::Specification.new do |spec|
  spec.name          = 'rabbitmq_pub_sub'
  spec.version       = RabbitmqPubSub::VERSION
  spec.authors       = ['EDIMO SOUSA SILVA']
  spec.email         = ['edimossilva@gmail.com']

  spec.summary       = 'https://github.com/edimossilva/rabbitmq_pub_sub'
  spec.description   = 'https://github.com/edimossilva/rabbitmq_pub_sub'
  spec.homepage      = 'https://github.com/edimossilva/rabbitmq_pub_sub'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://github.com/edimossilva/rabbitmq_pub_sub'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/edimossilva/rabbitmq_pub_sub'
  spec.metadata['changelog_uri'] = 'https://github.com/edimossilva/rabbitmq_pub_sub'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_dependency 'bunny'
end
