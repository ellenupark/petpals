class Event < ApplicationRecord
    has_many :invites
    has_many :pets, through: :invites

    accepts_nested_attributes_for :invites

    def host
        pet = Pet.find_by_id(self.host_pet_id)
        User.find_by_id(pet.user.id)
    end

    def host_pet
        Pet.find_by_id(self.host_pet_id)
    end
end