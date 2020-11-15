class Pet < ApplicationRecord
    has_many :invites
    has_many :events, through: :invites
    belongs_to :user
    has_one_attached :avatar

    validates :name, :breed, :weight, :gender, :birthdate, presence: true
    validate :birthdate_cannot_be_in_the_future


    def age
        if ((Time.zone.now - self.birthdate.to_time) / 1.year.seconds).floor == 0
            age = (Time.now.utc.to_date.year * 12 + Time.now.utc.to_date.month) - (self.birthdate.year * 12 + self.birthdate.month)
            age = "#{age} #{"month".pluralize(age)} old"
        else
            age = ((Time.zone.now - self.birthdate.to_time) / 1.year.seconds).floor
            age = "#{age} #{"year".pluralize(age)} old"
        end
        age
    end

    def birthdate_cannot_be_in_the_future
        if birthdate
            errors.add(:birthdate, "must be in the past.") if birthdate > Date.today
        end
    end  

    def events 
        self.user.confirmed_events.select do | event |
            event.pets.first == self || event.host_pet == self
        end
    end
end
