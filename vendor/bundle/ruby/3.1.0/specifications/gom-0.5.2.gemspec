# -*- encoding: utf-8 -*-
# stub: gom 0.5.2 ruby lib

Gem::Specification.new do |s|
  s.name = "gom".freeze
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philipp Br\u00FCll".freeze]
  s.date = "2011-10-20"
  s.description = "Core package of the General Object Mapper.".freeze
  s.email = "b.phifty@gmail.com".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze]
  s.homepage = "http://github.com/phifty/gom".freeze
  s.rubygems_version = "3.3.7".freeze
  s.summary = "General Object Mapper - maps any ruby object to different kinds of storage engines and vice versa.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<configure>.freeze, [">= 0.3.0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 2"])
    s.add_development_dependency(%q<reek>.freeze, [">= 1.2"])
  else
    s.add_dependency(%q<configure>.freeze, [">= 0.3.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2"])
    s.add_dependency(%q<reek>.freeze, [">= 1.2"])
  end
end
