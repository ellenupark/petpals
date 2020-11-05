class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def after_sign_in_path_for(resource)
    user_path(current_user) 
  end

  private
    def redirect_if_not_owner
      if !@pet
        redirect_to pets_path, alert: "Pet does not exist."
      elsif @pet.user != current_user
        redirect_to pet_path(@pet), alert: "This is not yours to edit."
      end
    end
    
  #   def redirect_if_not_logged_in(route, type, message)
  #     if !logged_in?
  #       flash[type] = message
  #       redirect route
  #     end
  #   end
    
  #   def redirect_if_logged_in
  #     if logged_in?
  #       redirect "/madlibs"
  #     end
  #   end

  #    # set flash key/value and redirect to route
  #   def redirect_to(route, type, message)
  #     flash[type] = message
  #     redirect route
  #   end
end
