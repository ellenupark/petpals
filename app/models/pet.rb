class Pet < ApplicationRecord
    has_many :invites
    has_many :events, through: :invites
    belongs_to :user
    has_one_attached :image
end
