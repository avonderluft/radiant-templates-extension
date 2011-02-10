module Templates::Helper

  def page_part_name(index)
    "page[parts_attributes][#{index}]"
  end
  
  def template_part_field(template_part, index, drafts_enabled = false)
    field_html = []
    if drafts_enabled
      live_part_content = @page.part(template_part.name).try(:content) || '' rescue ''
      live_field_name = "#{page_part_name(index)}[content]"
      live_field_id = "page_parts_#{index}_content"
      # part_content = @page.part(template_part.name).try(:draft_content) || ''
      part_content = @page.part(template_part.name).try(:draft_content) || '' rescue ''
      field_name = "#{page_part_name(index)}[draft_content]"
      field_id = "page_parts_#{index}_draft_content"
      field_html << hidden_field_tag(live_field_name, h(live_part_content), :id => live_field_id)
    else
      part_content = @page.part(template_part.name).try(:content) || '' rescue ''
      field_name = "#{page_part_name(index)}[content]"
      field_id = "page_parts_#{index}_content"
    end

    options = {:class => template_part.part_type.field_class, 
               :style => template_part.part_type.field_styles,
               :id => field_id}.reject{ |k,v| v.blank? }

    case template_part.part_type.field_type
      when "text_area"
        field_html << text_area_tag(field_name, h(part_content), options)

      when "text_field"
        field_html << text_field_tag(field_name, h(part_content), options)

      when "radio_button"
        options[:id] = "#{field_id}_true"
        field_html << " &mdash; " + radio_button_tag(field_name, "true", part_content =~ /true/, options) + label_tag("True")
        options[:id] = "#{field_id}_false"
        field_html << radio_button_tag(field_name, "false", part_content !~ /true/, options) + label_tag("False")

      when "hidden"
        field_html << hidden_field_tag(field_name, part_content, options)

      when "predefined"
        field_html << hidden_field_tag(field_name, template_part.description, options)
    end

    field_html.join("\n")
  end

  def child_menu_for(page)
    children = children_for(page)
    return nil if children.size < 2
    children.unshift(children.delete(page.default_child), :separator) if children.include?(page.default_child)
    name_for = proc { |p| (name = p.name.to_name('Page')).blank? ? t('blank_page') : name }
    content_tag :ul, :class => 'menu', :id => "allowed_children_#{page.id}" do
      children.map do |child|
        if child == :separator
          content_tag :li, nil, :class => 'separator'
        else
          info = child.name.eql?("Page") ? "Add child as 'Blank Page'" : "Add child as '#{child.name}' Page"
          link = child.name.eql?("Page") ? name_for[child] : image('template') + ' ' + name_for[child]
          content_tag :li, link_to(link, new_admin_page_child_path(page, :template => child), :title => info)
        end
      end
    end
  end

end