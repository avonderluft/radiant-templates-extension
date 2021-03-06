# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "radiant-templates-extension"
  s.version = "1.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew vonderLuft", "Sean Cribbs"]
  s.date = "2013-03-04"
  s.description = "Imposes structure on pages via content templates."
  s.email = "avonderluft@avlux.net"
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    "HELP_admin.textile",
    "HELP_designer.textile",
    "README.textile",
    "Rakefile",
    "VERSION",
    "app/controllers/admin/part_types_controller.rb",
    "app/controllers/admin/templates_controller.rb",
    "app/helpers/admin/part_types_helper.rb",
    "app/helpers/admin/templates_helper.rb",
    "app/models/part_type.rb",
    "app/models/template.rb",
    "app/models/template_part.rb",
    "app/views/admin/pages/_edit_template.html.haml",
    "app/views/admin/pages/_edit_template_part.html.haml",
    "app/views/admin/pages/_switch_templates.html.haml",
    "app/views/admin/pages/_template_chooser.html.haml",
    "app/views/admin/pages/_template_column.html.haml",
    "app/views/admin/pages/_template_column_header.html.haml",
    "app/views/admin/part_types/_form.html.haml",
    "app/views/admin/part_types/_list.html.haml",
    "app/views/admin/part_types/edit.html.haml",
    "app/views/admin/part_types/index.html.haml",
    "app/views/admin/part_types/new.html.haml",
    "app/views/admin/part_types/remove.html.haml",
    "app/views/admin/templates/_form.html.haml",
    "app/views/admin/templates/_template_part.html.haml",
    "app/views/admin/templates/_templates_css.html.haml",
    "app/views/admin/templates/edit.html.haml",
    "app/views/admin/templates/index.html.haml",
    "app/views/admin/templates/new.html.haml",
    "app/views/admin/templates/remove.html.haml",
    "config/initializers/radiant_config.rb",
    "config/locales/en.yml",
    "config/routes.rb",
    "db/migrate/001_create_templates.rb",
    "db/migrate/002_create_template_parts.rb",
    "db/migrate/003_rename_sublayout_column.rb",
    "db/migrate/004_add_position_to_templates.rb",
    "db/migrate/005_create_part_types.rb",
    "db/migrate/006_add_description_to_template_parts.rb",
    "db/migrate/007_add_page_class_name_to_templates.rb",
    "db/migrate/008_add_index_to_templates.rb",
    "db/migrate/009_create_default_part_types.rb",
    "db/migrate/010_update_boolean_part_type.rb",
    "db/migrate/011_add_timestamps.rb",
    "lib/file_system/model/part_type_extensions.rb",
    "lib/file_system/model/template_extensions.rb",
    "lib/tasks/templates_extension_tasks.rake",
    "lib/templates/associations.rb",
    "lib/templates/controller_extensions.rb",
    "lib/templates/helper.rb",
    "lib/templates/page_extensions.rb",
    "lib/templates/tags.rb",
    "public/images/admin/menu_arrow.png",
    "public/images/admin/move_higher.png",
    "public/images/admin/move_lower.png",
    "public/images/admin/move_to_bottom.png",
    "public/images/admin/move_to_top.png",
    "public/images/admin/part_type.png",
    "public/images/admin/template.png",
    "radiant-templates-extension.gemspec",
    "spec/controllers/admin_page_controller_extensions_spec.rb",
    "spec/controllers/part_types_controller_spec.rb",
    "spec/controllers/templates_controller_spec.rb",
    "spec/datasets/part_types_dataset.rb",
    "spec/datasets/templates_dataset.rb",
    "spec/helpers/templates_helper_spec.rb",
    "spec/models/page_extensions_spec.rb",
    "spec/models/part_type_spec.rb",
    "spec/models/tags_spec.rb",
    "spec/models/template_part_spec.rb",
    "spec/models/template_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "templates_extension.rb",
    "vendor/plugins/acts_as_list/README",
    "vendor/plugins/acts_as_list/init.rb",
    "vendor/plugins/acts_as_list/lib/active_record/acts/list.rb",
    "vendor/plugins/acts_as_list/test/list_test.rb",
    "vendor/plugins/make_resourceful/.gitignore",
    "vendor/plugins/make_resourceful/DEFAULTS",
    "vendor/plugins/make_resourceful/LICENSE",
    "vendor/plugins/make_resourceful/README",
    "vendor/plugins/make_resourceful/Rakefile",
    "vendor/plugins/make_resourceful/VERSION",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/resourceful_scaffold_generator.rb",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/controller.rb",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/fixtures.yml",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/functional_test.rb",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/helper.rb",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/migration.rb",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/model.rb",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/unit_test.rb",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/view__form.haml",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/view_edit.haml",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/view_index.haml",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/view_new.haml",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/view_partial.haml",
    "vendor/plugins/make_resourceful/generators/resourceful_scaffold/templates/view_show.haml",
    "vendor/plugins/make_resourceful/init.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/base.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/builder.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/default/accessors.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/default/actions.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/default/callbacks.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/default/responses.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/default/urls.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/maker.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/response.rb",
    "vendor/plugins/make_resourceful/lib/resourceful/serialize.rb",
    "vendor/plugins/make_resourceful/spec/accessors_spec.rb",
    "vendor/plugins/make_resourceful/spec/actions_spec.rb",
    "vendor/plugins/make_resourceful/spec/base_spec.rb",
    "vendor/plugins/make_resourceful/spec/builder_spec.rb",
    "vendor/plugins/make_resourceful/spec/callbacks_spec.rb",
    "vendor/plugins/make_resourceful/spec/integration_spec.rb",
    "vendor/plugins/make_resourceful/spec/maker_spec.rb",
    "vendor/plugins/make_resourceful/spec/response_spec.rb",
    "vendor/plugins/make_resourceful/spec/responses_spec.rb",
    "vendor/plugins/make_resourceful/spec/rspec-rails/LICENSE",
    "vendor/plugins/make_resourceful/spec/rspec-rails/redirect_to.rb",
    "vendor/plugins/make_resourceful/spec/rspec-rails/render_template.rb",
    "vendor/plugins/make_resourceful/spec/serialize_spec.rb",
    "vendor/plugins/make_resourceful/spec/spec_helper.rb",
    "vendor/plugins/make_resourceful/spec/urls_spec.rb"
  ]
  s.homepage = "https://github.com/avonderluft/radiant-templates-extension"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Templates Extension for Radiant CMS"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<radiant>, [">= 1.0.0.rc2"])
    else
      s.add_dependency(%q<radiant>, [">= 1.0.0.rc2"])
    end
  else
    s.add_dependency(%q<radiant>, [">= 1.0.0.rc2"])
  end
end

