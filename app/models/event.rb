class Event < ApplicationRecord
    has_many :invites, dependent: :destroy
    has_many :pets, through: :invites

    accepts_nested_attributes_for :invites

    validates :date, :address_line_one, :city, :state, :zip, presence: true
    validate :event_date_cannot_be_in_the_past

    scope :past_events, -> { where('date <= ?', Time.now ).where('accepted = ?', true) }

    def host
        if !!Pet.find_by_id(self.host_pet_id)
            pet = Pet.find_by_id(self.host_pet_id)
            User.find_by_id(pet.user.id)
        else
            return false;
        end
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
