class Invite < ApplicationRecord
    belongs_to :pet
    belongs_to :event
end
