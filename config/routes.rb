ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :templates, :member => { :move_higher => :post, :move_lower => :post,
                        :move_to_top => :post, :move_to_bottom => :post, :remove => :get}
    admin.resources :part_types, :member => { :remove => :get }
  end
end