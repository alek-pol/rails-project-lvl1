# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name    = 'hexlet_code'
  spec.version = HexletCode::VERSION
  spec.authors = ['alek_pol']
  spec.email   = ['alek_pol@outlook.com']

  spec.summary               = 'Form generator (demo)'
  spec.description           = 'Form generator (Hexlet project 1)'
  spec.homepage              = 'https://github.com/alek-pol/rails-project-lvl1'
  spec.required_ruby_version = '>= 2.7.5'

  spec.metadata['allowed_push_host'] = spec.homepage

  spec.metadata['homepage_uri']          = spec.homepage
  spec.metadata['source_code_uri']       = spec.homepage
  spec.metadata['changelog_uri']         = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rake', '~> 13.0'

  spec.add_development_dependency 'minitest', '~> 5.1'
  spec.add_development_dependency 'rubocop', '~> 1.30'
  spec.add_development_dependency 'rubocop-performance', '~> 1.14'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6'
  spec.add_development_dependency 'simplecov', '~> 0.21'
end
