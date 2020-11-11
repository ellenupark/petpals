class EventsController < ApplicationController
    before_action :set_event, only: [:accept, :decline, :destroy]
    before_action :redirect_if_not_event_owner, only: [:show]

    def new
        redirect_if_no_pets
        
        @recipient = Pet.find_by_id(params[:pet_id])
        @event = Event.new
        @event.invites.build
    end

    def create
        @event = Event.new(event_params)
        @event.invites.last.pet = Pet.all.find_by_id(params[:event][:pet_id])
        if @event.save
            redirect_to pet_event_path(@event.pets.first.id, @event.id)
        else
            redirect_to new_pet_event_path(params[:event][:pet_id]), alert: "Failed to create event: #{@event.errors.full_messages.to_sentence}"
        end
    end

    def show
        if params[:pet_id]
            @pet = Pet.find_by_id(params[:pet_id])
            @event = Event.find_by_id(params[:id])
        else
            @event = Event.find_by_id(params[:id])
        end
    end

    def accept 
        if @event
            @event.accepted = true
            @event.save
            redirect_to pet_event_path(@event.pets.first.id, @event.id), notice: "Event Confirmed!"
        else
            redirect_to user_path(current_user)
        end
    end

    def past_events 
        @events = Event.past_events.select { | event | event.host == current_user || event.pets.first.user == current_user }
    end

    def pending
        @events = current_user.unconfirmed_host_events
    end

    def decline
        redirect_to event_path(params[:id])
    end

    def destroy
        @event.destroy
        #add cancel notification?
        redirect_to user_path(current_user.id)
    end

    private

    def set_event
        @event = Event.find_by_id(params[:id])
    end

    def event_params
        params.require(:event).permit(:date, :address_line_one, :address_line_two, :city, :state, :zip, :host_pet_id, :accepted,
        invites_attributes: [:message])
    end

    def redirect_if_not_event_owner
        @event = Event.find_by_id(params[:id])
        if !@event
          redirect_to root_path, alert: "Event does not exist."
        elsif @event.host_pet.user != current_user && @event.pets.first.user != current_user
          redirect_to root_path, alert: "This is not yours to view."
        end
    end
end