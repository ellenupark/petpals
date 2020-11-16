class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable
  
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "can only contain letters or numbers" }
  
  has_many :pets

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do | user |
      user.provider = auth.provider
      user.username = auth.info.nickname
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def confirmed_events
    events = Event.joins(:invites).joins(:pets).where(host_pet_id: pet_ids_as_array).where(accepted: true).or(Event.where(accepted: true).joins(:invites).joins(:pets).where(pets: { user_id: self.id })).uniq
    events.select { | event | Event.past_events.include?(event) == false }
  end

  def unconfirmed_attendee_events
    events = Event.where(accepted: false).joins(:invites).joins(:pets).where(pets: { user_id: self.id }).uniq
    events.select { | event | Event.past_events.include?(event) == false }
  end

  def unconfirmed_host_events
    events = Event.where(host_pet_id: pet_ids_as_array).where(accepted: false)
    events.select { | event | Event.past_events.include?(event) == false }
  end

  def pet_ids_as_array
    Pet.select { | pet | pet.user == self }.map { | pet | pet.id }
  end

  def self.states 
    ['AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY']
  end
end
