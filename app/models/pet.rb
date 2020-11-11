class Pet < ApplicationRecord
    has_many :invites
    has_many :events, through: :invites
    belongs_to :user
    has_one_attached :avatar

    validates :name, :breed, :weight, :gender, :birthdate, presence: true

    def age_in_years
        ((Time.zone.now - self.birthdate.to_time) / 1.year.seconds).floor
    end

    def age_in_months
        (Time.now.utc.to_date.year * 12 + Time.now.utc.to_date.month) - (self.birthdate.year * 12 + self.birthdate.month)
    end
end
