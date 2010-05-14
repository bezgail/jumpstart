# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jumpstart}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["i0n"]
  s.date = %q{2010-05-12}
  s.default_executable = %q{jumpstart}
  s.description = %q{TODO: longer description of your gem}
  s.email = %q{ianalexanderwood@gmail.com}
  s.executables = ["jumpstart"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/jumpstart",
     "config/jumpstart_setup.yml",
     "jumpstart_templates/rails_3/.gitignore",
     "jumpstart_templates/rails_3/_._Gemfile",
     "jumpstart_templates/rails_3/app/views/home/index.haml",
     "jumpstart_templates/rails_3/app/views/layouts/application.haml",
     "jumpstart_templates/rails_3/config/_2._routes.rb",
     "jumpstart_templates/rails_3/config/deploy.rb",
     "jumpstart_templates/rails_3/config/environments/_18._development.rb",
     "jumpstart_templates/rails_3/config/environments/_27._test.rb",
     "jumpstart_templates/rails_3/config/environments/_41._production.rb",
     "jumpstart_templates/rails_3/config/initializers/setup_mail.rb",
     "jumpstart_templates/rails_3/jumpstart_config/nginx.local.conf",
     "jumpstart_templates/rails_3/jumpstart_config/nginx.remote.conf",
     "jumpstart_templates/rails_3/jumpstart_config/rails_3.rb",
     "jumpstart_templates/rails_3/jumpstart_config/rails_3.yml",
     "jumpstart_templates/rails_3/lib/development_mail_interceptor.rb",
     "jumpstart_templates/rails_3/lib/generators/authlogic.rb",
     "jumpstart_templates/rails_3/lib/generators/authlogic/session/session_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/authlogic/session/templates/session.rb",
     "jumpstart_templates/rails_3/lib/generators/datamapper.rb",
     "jumpstart_templates/rails_3/lib/generators/datamapper/migration/migration_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/datamapper/migration/templates/migration.rb",
     "jumpstart_templates/rails_3/lib/generators/datamapper/model/model_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/datamapper/model/templates/migration.rb",
     "jumpstart_templates/rails_3/lib/generators/datamapper/model/templates/model.rb",
     "jumpstart_templates/rails_3/lib/generators/datamapper/observer/observer_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/datamapper/observer/templates/observer.rb",
     "jumpstart_templates/rails_3/lib/generators/factory_girl.rb",
     "jumpstart_templates/rails_3/lib/generators/factory_girl/model/model_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/factory_girl/model/templates/fixtures.rb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb.rb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/USAGE",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/controller/controller_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/controller/templates/view.html.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/scaffold/scaffold_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/scaffold/templates/_form.html.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/scaffold/templates/edit.html.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/scaffold/templates/index.html.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/scaffold/templates/layout.html.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/scaffold/templates/new.html.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_erb/scaffold/templates/show.html.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml.rb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/USAGE",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/controller/controller_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/controller/templates/view.html.haml",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/scaffold/scaffold_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/scaffold/templates/_form.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/scaffold/templates/edit.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/scaffold/templates/index.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/scaffold/templates/layout.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/scaffold/templates/new.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/formtastic_haml/scaffold/templates/show.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/haml.rb",
     "jumpstart_templates/rails_3/lib/generators/haml/controller/controller_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/haml/controller/templates/view.html.haml",
     "jumpstart_templates/rails_3/lib/generators/haml/scaffold/scaffold_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/haml/scaffold/templates/_form.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/haml/scaffold/templates/edit.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/haml/scaffold/templates/index.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/haml/scaffold/templates/layout.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/haml/scaffold/templates/new.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/haml/scaffold/templates/show.haml.erb",
     "jumpstart_templates/rails_3/lib/generators/machinist.rb",
     "jumpstart_templates/rails_3/lib/generators/machinist/model/model_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/machinist/model/templates/blueprint.rb",
     "jumpstart_templates/rails_3/lib/generators/machinist/model/templates/machinist_initializer.rb",
     "jumpstart_templates/rails_3/lib/generators/mongomapper.rb",
     "jumpstart_templates/rails_3/lib/generators/mongomapper/model/model_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/mongomapper/model/templates/model.rb",
     "jumpstart_templates/rails_3/lib/generators/mongomapper/observer/observer_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/shoulda.rb",
     "jumpstart_templates/rails_3/lib/generators/shoulda/controller/controller_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/shoulda/controller/templates/controller.rb",
     "jumpstart_templates/rails_3/lib/generators/shoulda/model/model_generator.rb",
     "jumpstart_templates/rails_3/lib/generators/shoulda/model/templates/model.rb",
     "jumpstart_templates/rails_3/lib/tasks/populate.rake",
     "jumpstart_templates/rails_3/public/javascripts/init.js",
     "jumpstart_templates/rails_3/public/javascripts/jquery-1.4.2.min.js",
     "jumpstart_templates/rails_3/public/javascripts/jquery-ui-1.8.custom.min.js",
     "jumpstart_templates/rails_3/public/javascripts/rails.js",
     "jumpstart_templates/rails_3/public/stylesheets/sass/_setup.sass",
     "jumpstart_templates/rails_3/public/stylesheets/sass/global.sass",
     "jumpstart_templates/rails_3/public/stylesheets/sass/handheld.sass",
     "jumpstart_templates/rails_3/public/stylesheets/sass/ie.sass",
     "jumpstart_templates/rails_3/public/stylesheets/sass/print.sass",
     "jumpstart_templates/rails_3/public/stylesheets/sass/screen.sass",
     "jumpstart_templates/test1/jumpstart_config/test1.yml",
     "jumpstart_templates/test2/jumpstart_config/test2.yml",
     "jumpstart_templates/test3/jumpstart_config/test3.yml",
     "lib/jumpstart.rb",
     "lib/jumpstart/base.rb",
     "lib/jumpstart/fileutils.rb",
     "test/helper.rb",
     "test/test_jumpstart.rb"
  ]
  s.homepage = %q{http://github.com/i0n/jumpstart}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6.1}
  s.summary = %q{TODO: one-line summary of your gem}
  s.test_files = [
    "test/helper.rb",
     "test/test_jumpstart.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end
