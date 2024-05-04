# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name = 'hexlet_code'
  spec.version = HexletCode::VERSION
  spec.authors = ['Khamitskiy Vladislav']
  spec.email = ['vladislaviktorovic@gmail.com']

  spec.summary = 'Form generator'
  spec.description = 'Form generator is a DSL that makes it easy to generate forms.'
  spec.homepage = 'https://github.com/khamitskiy-vlad/rails-project-63'
  spec.license = 'MIT'
  spec.required_ruby_version = '3.2.2'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/khamitskiy-vlad/rails-project-63'
  spec.metadata['changelog_uri'] = 'https://github.com/khamitskiy-vlad/rails-project-63'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-power_assert', '~> 0.3.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'
end
