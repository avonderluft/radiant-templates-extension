class Admin::PartTypesController < Admin::ResourceController

  only_allow_access_to :index, :show, :new, :edit, :create, :update, :remove, :destroy,
    :when => [:admin],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have admin privileges to perform this action.'

end
