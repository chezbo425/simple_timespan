# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'simple_timespan'
  spec.version       = "0.2.1"
  spec.authors       = ['Chuck Felish']
  spec.email         = ['chezbo425@gmail.com']

  spec.summary       = 'Provides a SimpleTimespan support class'
  spec.description   = 'A class intended to simplify conversion of a seconds based timespan into one ' +
      'where properties of interest (such as seconds, hours, minutes, days) are immediately available.'
  spec.homepage      = 'https://github.com/chezbo425/simple_timespan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'minitest', '~> 5.15'
end
