# frozen_string_literal: true

require_relative 'lib/epub_maker/version'

Gem::Specification.new do |spec|
  spec.name          = 'epub_maker'
  spec.version       = EPUBMaker::VERSION
  spec.authors       = ['Igor S. Morozov']
  spec.email         = ['igor@morozov.is']

  spec.summary       = ''
  spec.description   = ''
  spec.homepage      = 'https://github.com/Morozzzko/epubmaker'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Morozzzko/epubmaker'
  spec.metadata['changelog_uri'] = 'https://github.com/Morozzzko/epubmaker/blob/master/README.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['LICENSE.txt', 'README.md', 'lib/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'dry-cli'
  spec.add_dependency 'dry-core'
  spec.add_dependency 'gepub'
  spec.add_dependency 'tty-prompt'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov', '~> 0.17.0'
end
