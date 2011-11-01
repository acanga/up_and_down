class ApplicationController < ActionController::Base
  protect_from_forgery 
  
  layout :layout
  
  protected
    def layout      
     if devise_controller? and not (is_a? Devise::RegistrationsController and (action_name == "edit" or action_name == "update"))
       "devise"
     else
       "application"
     end
   end
end