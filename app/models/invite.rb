class Invite < ApplicationRecord
    belongs_to :pet
    belongs_to :event

    validates :message, presence: true

end
