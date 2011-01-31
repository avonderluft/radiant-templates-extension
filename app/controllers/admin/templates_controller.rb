class Admin::TemplatesController < ApplicationController

  only_allow_access_to :index, :show, :new, :create, :edit, :update, :remove, :destroy, :move_higher, :move_lower, :move_to_top, :move_to_bottom,
    :when => [:designer, :admin],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'

  make_resourceful do
    actions :index, :show, :new, :create, :edit, :update, :remove, :destroy

    response_for(:show) do
      redirect_to edit_admin_template_url
    end

    response_for(:create, :update) do
      redirect_to params[:continue] ? edit_admin_template_url(current_object) : objects_path
    end

    response_for(:destroy, :destroy_fails) do
      redirect_to objects_path
    end
  end

  # Ordering actions
  %w{move_higher move_lower move_to_top move_to_bottom}.each do |action|
    define_method action do
      load_object
      Template.reordering do
        current_object.send(action)
      end
      request.env["HTTP_REFERER"] ? redirect_to(:back) : redirect_to(objects_path)
    end
  end

  def instance_variable_name
    'content_templates'
  end
end
