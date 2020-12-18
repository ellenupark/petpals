class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @pet = Pet.random_pet
  end

  def after_sign_in_path_for(resource)
    user_path(current_user) 
  end

  private
    def redirect_if_not_owner
      if !@pet
        redirect_to root_path, alert: "Pet does not exist."
      elsif @pet.user != current_user
        redirect_to root_path, alert: "This is not yours to view."
      end
    end

    def redirect_if_not_event_owner
      @event = Event.find_by_id(params[:id])
      if !@event
          redirect_to root_path, alert: "Event does not exist."
      elsif @event.host != current_user && @event.pets.first.user != current_user
          redirect_to root_path, alert: "This is not yours to view."
      end
    end

    def redirect_if_no_pets
      if current_user.pets.empty?
        redirect_back(fallback_location:"/", alert: "You do not have any pets! #{view_context.link_to 'Add Pet?', new_pet_path}")
      end
    end

    def redirect_if_pet_belongs_to_user
      current_user.pets.each do | pet |
        redirect_to pets_path, alert: "Cannot invite your own pet to a playdate." if pet.id.to_s == params[:pet_id] 
      end
    end

    def redirect_if_not_logged_in(route, message)
      if !user_signed_in?
        redirect_to route, alert: message
      end
    end

    def redirect_if_not_participant
      if @event.host != current_user && @event.pets.first.user != current_user
        redirect_back(fallback_location:"/", alert: "This is not yours to edit.")
      end
    end

    # set flash key/value and redirect to route
    # def redirect_to(route, type, message)
    #   flash[type] = message
    #   redirect_to route
    # end
end
