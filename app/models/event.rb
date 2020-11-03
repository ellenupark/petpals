class Event < ApplicationRecord
    has_many :invites
    has_many :pets, through: :invites

    accepts_nested_attributes_for :invites

    def host
        User.find_by_id(self.host_pet_id.user.id)
    end
end
