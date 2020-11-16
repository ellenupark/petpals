class Event < ApplicationRecord
    has_many :invites
    has_many :pets, through: :invites

    accepts_nested_attributes_for :invites

    validates :date, :address_line_one, :city, :state, :zip, presence: true
    # validate :event_date_cannot_be_in_the_past

    scope :past_events, lambda { where('date <= ?', Time.now ).where('accepted = ?', true) }

    def host
        pet = Pet.find_by_id(self.host_pet_id)
        User.find_by_id(pet.user.id)
    end

    def host_pet
        Pet.find_by_id(self.host_pet_id)
    end

    def event_date_cannot_be_in_the_past
        if date 
            errors.add(:date, "cannot be in the past.") if date < Date.today
        end
    end  
end
