class EventsController < ApplicationController
    before_action :set_event, only: [:accept, :decline, :destroy, :show]
    before_action :redirect_if_not_event_owner

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
            render "new"
        end
    end

    def show
    end

    def accept 
        if @event
            @event.accepted = true
            @event.save
            redirect_to pet_event_path(@event.pets.first.id, @event.id)
        else
            redirect_to user_path(current_user)
        end
    end

    def history 
        @events = Event.past_events.select { | event | event.host == current_user || event.pets.first.user == current_user }
    end

    def pending
        @events = current_user.unconfirmed_host_events
    end

    def decline
        binding.pry
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
end