module Admin::TemplatesHelper
  
  def template_edit_javascripts
    <<-JS
      var template_parts_index = 0;
      var template_part_partial = new Template(#{blank_template_part});
      function new_template_part(){
        var parts = $('parts');
        if(parts.down('.template_part')){
          var id = parts.select('.template_part').last().id;
          template_parts_index = parseInt(id.split("_").last());
        }
        template_parts_index += 1;
        new Insertion.Bottom('parts', template_part_partial.evaluate({index: template_parts_index}));
      }
      
      function zeroPad(num,count){
        var numZeropad = num + '';
        while(numZeropad.length < count) {
          numZeropad = "0" + numZeropad;
        }
        return numZeropad;
      }
      
      function fix_template_part_indexes(){
        var parts = $('parts');
        var new_index = 0;
        parts.select(".template_part").each(function(row){
          new_index += 1;
          row.select("input, select, textarea").each(function(input){
            input.name = input.name.sub(/\\d+/, zeroPad(new_index,2));
          });
        });
      }
      
      function reorder_template_part(element, direction){
        var parts = $('parts');
        var template_part = $(element).up('.template_part');
        switch(direction){
          case 'up':
            if(template_part.previous())
              template_part.previous().insert({ before: template_part });
            break;
          case 'down':
            if(template_part.next())
              template_part.next().insert({ after: template_part });
            break;
          case 'top':
            parts.insert({ top: template_part });
            break;
          case 'bottom':
            parts.insert({ bottom: template_part });
            break;
          default:
            break;
        }
        fix_template_part_indexes();
      }
    JS
  end
  
  def filter_options
    [['none', '']] + TextFilter.descendants.map { |f| f.filter_name }.sort
  end
  
  def part_type_options
    PartType.find(:all, :order => "name ASC").map {|t| [t.name, t.id]}
  end
  
  def blank_template_part
    ostruct = OpenStruct.new(:index => '#{index}')
    @blank_template_part ||= (render :partial => "template_part", :object => ostruct).to_json
  end
  
  def order_links(template)
    returning String.new do |output|
      %w{move_to_top move_higher move_lower move_to_bottom}.each do |action|
        output << link_to(image("#{action}.png", :alt => action.humanize), 
                          url_for(:action => action, :id => template), 
                          :method => :post)
      end
    end
  end

  def updated_stamp(model)
    unless model.new_record?
      updated_by = (model.updated_by || model.created_by) if model.respond_to?(:updated_by)
      login = updated_by ? updated_by.login : nil
      time = (model.updated_at || model.created_at)
      # promoted_at = model.draft_promoted_at if model.respond_to?(:draft_promoted_at)
      html = %{<p style="clear: left"><small>}
      if login or time
        html << 'Last updated '
        html << %{by #{login} } if login
        html << %{at #{ timestamp(time) }} if time
        html << '. '
      end
      # if promoted_at
      #   html << %{Last promoted at #{ timestamp(promoted_at) }.}
      # end
      html << %{</small></p>}
      html
    else
      %{<p class="clear">&nbsp;</p>}
    end
  end

end
