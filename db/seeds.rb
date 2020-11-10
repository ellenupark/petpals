# Users - Brooklyn
ellen = User.create(email: "ellen@ellen.com", username: "ellen", city: "Brooklyn", state: "NY", password: "password")
kyo = User.create(email: "kyo@kyo.com", username: "kyo", city: "Brooklyn", state: "NY", password: "password")
john = User.create(email: "john@john.com", username: "john", city: "Brooklyn", state: "NY", password: "password")
natalie = User.create(email: "natalie@natalie.com", username: "natalie", city: "Brooklyn", state: "NY", password: "password")
emily = User.create(email: "emily@emily.com", username: "emily", city: "Brooklyn", state: "NY", password: "password")

# Users - Seattle
rachel = User.create(email: "rachel@rachel.com", username: "rachel", city: "Seattle", state: "WA", password: "password")
adriana = User.create(email: "adriana@adriana.com", username: "adriana", city: "Seattle", state: "WA", password: "password")
susan = User.create(email: "susan@susan.com", username: "susan", city: "Seattle", state: "WA", password: "password")
michael = User.create(email: "michael@michael.com", username: "michael", city: "Seattle", state: "WA", password: "password")
ruth = User.create(email: "ruth@ruth.com", username: "ruth", city: "Seattle", state: "WA", password: "password")

# Pets - Brooklyn
sumi = ellen.pets.create(name: "Sumi", breed: "Pomsky", gender: "Male", weight: "Medium 11-23lbs")
sumi.avatar.attach(io: File.open('./public/seed_images/sumi.jpeg'), filename: 'sumi.jpg')
sumi.save

bianca = ellen.pets.create(name: "Bianca", breed: "Bichon Frise", gender: "Female", weight: "Medium 11-23lbs")
bianca.avatar.attach(io: File.open('./public/default-profile.jpg'), filename: 'default-profile.jpg')
bianca.save

spot = kyo.pets.create(name: "Spot", breed: "Dalmation", gender: "Male", weight: "XLarge 46-70lbs")
spot.avatar.attach(io: File.open('./public/seed_images/dalmation.jpg'), filename: 'dalmation.jpg')
spot.save

toby = john.pets.create(name: "Toby", breed: "Shih Tzu", gender: "Male", weight: "Medium 11-23lbs")
toby.avatar.attach(io: File.open('./public/seed_images/shihtzu.jpeg'), filename: 'shihtzu.jpeg')
toby.save

aristotle = natalie.pets.create(name: "Aristotle", breed: "Poodle", gender: "Male", weight: "Large 24-45lbs")
aristotle.avatar.attach(io: File.open('./public/seed_images/poodle-1.jpg'), filename: 'poodle-1.jpg')
aristotle.save

snow = emily.pets.create(name: "Snow", breed: "Samoyed", gender: "Female", weight: "Large 24-45lbs")
snow.avatar.attach(io: File.open('./public/seed_images/samoyed-dogs-puppies-1.jpg'), filename: 'samoyed-dogs-puppies-1.jpg')
snow.save

# Pets - Seattle
kiki = rachel.pets.create(name: "Kiki", breed: "Keeshond", gender: "Female", weight: "Large 24-45lbs")
kiki.avatar.attach(io: File.open('./public/seed_images/keeshond.jpg'), filename: 'keeshond.jpg')
kiki.save

loki = adriana.pets.create(name: "Loki", breed: "Miniature Australian Shepherd", gender: "Male", weight: "Medium 11-23lbs")
loki.avatar.attach(io: File.open('./public/seed_images/Australian-Shepherd.jpeg'), filename: 'Australian-Shepherd.jpeg')
loki.save

lucy = susan.pets.create(name: "Lucy", breed: "Golden Retriever", gender: "Female", weight: "XLarge 46-70lbs")
lucy.avatar.attach(io: File.open('./public/seed_images/keeshond.jpg'), filename: 'keeshond.jpg')
lucy.save

shishito = michael.pets.create(name: "Shishito", breed: "Chihuahua", gender: "Male", weight: 'XSmall 0-4lbs')
shishito.avatar.attach(io: File.open('./public/seed_images/chihuahua-portrait.jpg'), filename: 'chihuahua-portrait.jpg')
shishito.save

diluc = ruth.pets.create(name: "Diluc", breed: "Cane Corso", gender: "Male", weight: "XLarge 46-70lbs")
diluc.avatar.attach(io: File.open('./public/seed_images/cane-corso.jpg'), filename: 'cane-corso.jpg')
diluc.save

# Events/Invites
event_one = Event.create(date: "2020-11-18 12:45:00", address_line_one: Faker::Address.street_address, address_line_two: Faker::Address.secondary_address, city: "Brooklyn", state: "NY", zip: Faker::Address.zip, host_pet_id: 2, accepted: false)
event_one.invites.create(pet_id: 5, message: "Hello!")
