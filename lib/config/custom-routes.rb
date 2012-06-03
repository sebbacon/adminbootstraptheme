# Here you can override or add to the pages in the core website


require 'dispatcher'
Dispatcher.to_prepare do
    ActionController::Routing::Routes.draw do |map|
        # Add a route for admin.js to the general controller
        map.with_options :controller => 'general' do |general|
            general.admin_js '/adminbootstraptheme/javascripts/admin.js', :action => 'admin_js'
        end
    end
end
