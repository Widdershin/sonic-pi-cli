Gem::Specification.new do |s|
  s.name        = 'sonic-pi-cli'
  s.version     = '0.1.3'
  s.date        = '2019-08-26'
  s.summary     = "Sonic Pi CLI"
  s.description = "A simple command line interface for Sonic Pi"
  s.authors     = ["Nick Johnstone"]
  s.email       = 'ncwjohnstone@gmail.com'
  s.files       = ["lib/sonic_pi.rb"]
  s.executables << "sonic_pi"
  s.homepage    = 'http://rubygems.org/gems/sonic-pi-cli'
  s.license     = 'MIT'

  s.add_dependency 'osc-ruby'
end
