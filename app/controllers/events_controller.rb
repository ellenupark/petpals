class EventsController < ApplicationController
    def new
        @event = Event.new
        @event.invites.build(pet_id: params[:pet_id])
    end

    def create
        @event = Event.new(event_params)
        @event.invites.last.pet_id = params[:event][:pet_id]
        if @event.save
            redirect_to pet_event_path(@event.pets.first.id, @event.id)
        else
            render "new"
        end
    end

    def show
        @event = Event.find_by_id(params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:date, :address_line_one, :address_line_two, :city, :state, :zip, :host_pet_id, :accepted,
        invites_attributes: [:message])
    end
end