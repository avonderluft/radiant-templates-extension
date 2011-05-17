# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'

class TemplatesExtension < Radiant::Extension
  version "#{File.read(File.expand_path(File.dirname(__FILE__)) + '/VERSION')}"
  description "Imposes structure on pages via content templates"
  url "https://github.com/avonderluft/radiant-templates-extension/tree/master"

  def activate
    begin
      FileSystem::MODELS << "PartType" << "Template"
    rescue NameError, LoadError
    end
    Page.class_eval do
      include Templates::Associations
      include Templates::Tags
      include Templates::PageExtensions
    end
    Admin::PagesController.class_eval do
      include Templates::ControllerExtensions 
      helper Templates::Helper
    end
    tab "Design" do
      add_item "Templates", "/admin/templates", :before => "Layouts"
      add_item "Template Part Types", "/admin/part_types", :after => "Templates"
    end
    # Admin UI customization
    admin.page.index.add :node, 'template_column', :after => 'title_column'
    admin.page.index.add :sitemap_head, 'template_column_header', :after => 'title_column_header'
    admin.page.edit.add :main, "template_chooser", :before => "edit_header"
    admin.page.edit.add :form, 'edit_template', :before => 'edit_page_parts'
    admin.page.edit.form.delete 'edit_page_parts'
    admin.page.edit.parts_bottom.delete 'edit_layout_and_type'

    Radiant::AdminUI.class_eval do
      attr_accessor :template
      attr_accessor :part_type
      alias_method "templates", :template
      alias_method "part_types", :part_type
    end
    admin.template = load_default_template_regions
    admin.part_type = load_default_part_type_regions
  end

  def load_default_template_regions
    OpenStruct.new.tap do |template|
      template.edit = Radiant::AdminUI::RegionSet.new do |edit|
        edit.main.concat %w{edit_header edit_form}
        edit.form.concat %w{edit_title edit_content}
        edit.layout.concat %w{edit_layout edit_type}
        edit.form_bottom.concat %w{edit_buttons edit_timestamp}
        edit.bottom.concat %w{parts_button}
      end
      template.index = Radiant::AdminUI::RegionSet.new do |index|
        index.top.concat %w{}
        index.thead.concat %w{title_header parts_header actions_header order_header}
        index.tbody.concat %w{title_cell parts_cell actions_cell order_cell}
        index.bottom.concat %w{new_button}
      end
      template.new = template.edit
    end
  end

  def load_default_part_type_regions
    OpenStruct.new.tap do |part_type|
      part_type.edit = Radiant::AdminUI::RegionSet.new do |edit|
        edit.main.concat %w{edit_header edit_form}
        edit.form.concat %w{edit_title edit_content}
        edit.layout.concat %w{edit_layout edit_type}
        edit.form_bottom.concat %w{edit_buttons edit_timestamp}
        edit.bottom.concat %w{parts_button}
      end
      part_type.index = Radiant::AdminUI::RegionSet.new do |index|
        index.top.concat %w{}
        index.thead.concat %w{title_header type_header class_header styles_header actions_header}
        index.tbody.concat %w{title_cell type_cell class_cell styles_cell actions_cell}
        index.bottom.concat %w{new_button}
      end
      part_type.new = part_type.edit
    end
  end

end