# -*- encoding: utf-8 -*-
# stub: configure 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "configure".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philipp Br\u00C3\u00BCll".freeze]
  s.date = "2011-04-08"
  s.description = "It provides a single-method interface that receives a block and returns well-structured configuration values.".freeze
  s.email = "b.phifty@gmail.com".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze]
  s.homepage = "http://github.com/phifty/configure".freeze
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Configure offers an easy way for configure your application using a DSL.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rspec>.freeze, [">= 2"])
    s.add_development_dependency(%q<reek>.freeze, [">= 1.2"])
  else
    s.add_dependency(%q<rspec>.freeze, [">= 2"])
    s.add_dependency(%q<reek>.freeze, [">= 1.2"])
  end
end
