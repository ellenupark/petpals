class Event < ApplicationRecord
    has_many :invites
    has_many :pets, through: :invites

    accepts_nested_attributes_for :invites
end
