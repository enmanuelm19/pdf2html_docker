lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pdf2html_docker/version'

Gem::Specification.new do |spec|
  spec.name          = 'pdf2html_docker'
  spec.version       = Pdf2htmlDocker::VERSION
  spec.authors       = ['Enmanuel']
  spec.email         = ['enmanuelm19@gmail.com']

  spec.summary       = 'PDF to HTML converter that use containerised pdf2HtmlEX library'
  spec.description   = 'It converts any kind of PDF documents to HTML, maintaining the style'
  spec.homepage      = 'https://github.com/enmanuelm19/pdf2html_docker'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/enmanuelm19/pdf2html_docker'
    spec.metadata['changelog_uri'] = 'https://github.com/enmanuelm19/pdf2html_docker'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'terrapin', '~> 0.6.0'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'irb', '~> 1.0.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
