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

sumi = ellen.pets.create(name: "Mochi", image: 'https://animalso.com/wp-content/uploads/2016/10/Pomsky-3-1.jpg', breed: "Pomsky", gender: "Male", weight: "Medium 11-23lbs", birthdate: "2020-05-06")

bianca = ellen.pets.create(name: "Bianca", image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Bichon_Fris%C3%A9_sitting.jpg/1200px-Bichon_Fris%C3%A9_sitting.jpg', breed: "Bichon Frise", gender: "Female", weight: "Medium 11-23lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

spot = kyo.pets.create(name: "Spot", image: 'https://www.rd.com/wp-content/uploads/2019/07/shutterstock_1161034495-scaled.jpg', breed: "Dalmation", gender: "Male", weight: "XLarge 46-70lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

toby = john.pets.create(name: "Toby", image: 'https://vetstreet.brightspotcdn.com/dims4/default/ce3c8fb/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F1d%2Ffa9860a80511e0a0d50050568d634f%2Ffile%2FShih-Tzu-1-645mk062811.jpg', breed: "Shih Tzu", gender: "Male", weight: "Medium 11-23lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

aristotle = natalie.pets.create(name: "Aristotle", image: 'https://www.purelypetsinsurance.co.uk/media/1284/poodle-1.jpg', breed: "Poodle", gender: "Male", weight: "Large 24-45lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

snow = emily.pets.create(name: "Snow", image: 'https://www.rover.com/blog/wp-content/uploads/2019/11/samoyed-puppy-in-grass-960x540.jpg', breed: "Samoyed", gender: "Female", weight: "Large 24-45lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

# sumi = ellen.pets.create(name: "Sumi", breed: "Pomsky", gender: "Male", weight: "Medium 11-23lbs", birthdate: "2020-05-06")
# sumi.avatar.attach(io: File.open('./public/seed_images/IMG_4170.jpg'), filename: 'IMG_4170.jpg')
# sumi.save

# bianca = ellen.pets.create(name: "Bianca", breed: "Bichon Frise", gender: "Female", weight: "Medium 11-23lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# bianca.avatar.attach(io: File.open('./public/default-profile.jpg'), filename: 'default-profile.jpg')
# bianca.save

# spot = kyo.pets.create(name: "Spot", breed: "Dalmation", gender: "Male", weight: "XLarge 46-70lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# spot.avatar.attach(io: File.open('./public/seed_images/dalmation.jpg'), filename: 'dalmation.jpg')
# spot.save

# toby = john.pets.create(name: "Toby", breed: "Shih Tzu", gender: "Male", weight: "Medium 11-23lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# toby.avatar.attach(io: File.open('./public/seed_images/shihtzu.jpeg'), filename: 'shihtzu.jpeg')
# toby.save

# aristotle = natalie.pets.create(name: "Aristotle", breed: "Poodle", gender: "Male", weight: "Large 24-45lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# aristotle.avatar.attach(io: File.open('./public/seed_images/poodle-1.jpg'), filename: 'poodle-1.jpg')
# aristotle.save

# snow = emily.pets.create(name: "Snow", breed: "Samoyed", gender: "Female", weight: "Large 24-45lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# snow.avatar.attach(io: File.open('./public/seed_images/samoyed-dogs-puppies-1.jpg'), filename: 'samoyed-dogs-puppies-1.jpg')
# snow.save
# Pets - Seattle
kiki = rachel.pets.create(name: "Kiki", image: 'https://www.thesprucepets.com/thmb/tXFXi9IW90rGzUVn32loYLVFV5w=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1163155709-b7afc58ecc064d0ca189e2f73ccc5b43.jpg', breed: "Keeshond", gender: "Female", weight: "Large 24-45lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

loki = adriana.pets.create(name: "Loki", image: 'https://www.doggoneproblems.com/wp-content/uploads/2019/04/Spike-Los-Feliz-Australian-Shepherd.jpeg', breed: "Miniature Australian Shepherd", gender: "Male", weight: "Medium 11-23lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

lucy = susan.pets.create(name: "Lucy", image: 'https://www.hainesroadanimalhospital.com/sites/default/files/styles/large/adaptive-image/public/golden-retriever-dog-breed-info.jpg?itok=-kzTcc9h', breed: "Golden Retriever", gender: "Female", weight: "XLarge 46-70lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

shishito = michael.pets.create(name: "Shishito", image: 'https://www.dogster.com/wp-content/uploads/2018/09/black-and-tan-chiahuahua-600x400.jpg', breed: "Chihuahua", gender: "Male", weight: 'XSmall 0-4lbs', birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

diluc = ruth.pets.create(name: "Diluc", image: 'https://figopetinsurance.com/sites/default/files/imagedogsblack-cane-corso-dog-outsideblog.jpg', breed: "Cane Corso", gender: "Male", weight: "XLarge 46-70lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))

# kiki = rachel.pets.create(name: "Kiki", breed: "Keeshond", gender: "Female", weight: "Large 24-45lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# kiki.avatar.attach(io: File.open('./public/seed_images/keeshond.jpg'), filename: 'keeshond.jpg')
# kiki.save

# loki = adriana.pets.create(name: "Loki", breed: "Miniature Australian Shepherd", gender: "Male", weight: "Medium 11-23lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# loki.avatar.attach(io: File.open('./public/seed_images/Australian-Shepherd.jpeg'), filename: 'Australian-Shepherd.jpeg')
# loki.save

# lucy = susan.pets.create(name: "Lucy", breed: "Golden Retriever", gender: "Female", weight: "XLarge 46-70lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# lucy.avatar.attach(io: File.open('./public/seed_images/golden-retriever-dog-breed-info.jpg'), filename: 'golden-retriever-dog-breed-info.jpg')
# lucy.save

# shishito = michael.pets.create(name: "Shishito", breed: "Chihuahua", gender: "Male", weight: 'XSmall 0-4lbs', birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# shishito.avatar.attach(io: File.open('./public/seed_images/chihuahua-portrait.jpg'), filename: 'chihuahua-portrait.jpg')
# shishito.save

# diluc = ruth.pets.create(name: "Diluc", breed: "Cane Corso", gender: "Male", weight: "XLarge 46-70lbs", birthdate: Faker::Date.between(from: '2010-01-01', to: '2020-10-31'))
# diluc.avatar.attach(io: File.open('./public/seed_images/cane-corso.jpg'), filename: 'cane-corso.jpg')
# diluc.save

# # Events/Invites - Pending
# pending_event_one = Event.create(date: "2020-11-18 12:45:00", address_line_one: Faker::Address.street_address, address_line_two: Faker::Address.secondary_address, city: "Brooklyn", state: "NY", zip: Faker::Address.zip, host_pet_id: 2, accepted: false)
# pending_event_one.invites.create(pet_id: 5, message: "Hello!")

# pending_event_two = Event.create(date: "2020-11-20 12:00:00", address_line_one: Faker::Address.street_address, address_line_two: Faker::Address.secondary_address, city: "Seattle", state: "WA", zip: Faker::Address.zip, host_pet_id: 11, accepted: false)
# pending_event_two.invites.create(pet_id: 8, message: "Hello!")

# pending_event_three = Event.create(date: "2020-11-21 14:30:00", address_line_one: Faker::Address.street_address, address_line_two: Faker::Address.secondary_address, city: "Brooklyn", state: "NY", zip: Faker::Address.zip, host_pet_id: 6, accepted: false)
# pending_event_three.invites.create(pet_id: 1, message: "Hello!")


# # Events/Invites - Confirmed
# confirmed_event_one = Event.create(date: "2020-11-17 19:21:00", address_line_one: Faker::Address.street_address, address_line_two: Faker::Address.secondary_address, city: "Brooklyn", state: "NY", zip: Faker::Address.zip, host_pet_id: 1, accepted: true)
# confirmed_event_one.invites.create(pet_id: 3, message: "Hello!")

# confirmed_event_two = Event.create(date: "2020-11-19 13:30:00", address_line_one: Faker::Address.street_address, address_line_two: Faker::Address.secondary_address, city: "Brooklyn", state: "NY", zip: Faker::Address.zip, host_pet_id: 3, accepted: true)
# confirmed_event_two.invites.create(pet_id: 10, message: "Hello!")

# # confirmed_event_three = Event.create(date: "2020-11-05 12:30:00", address_line_one: Faker::Address.street_address, address_line_two: Faker::Address.secondary_address, city: "Brooklyn", state: "NY", zip: Faker::Address.zip, host_pet_id: 2, accepted: true)
# # confirmed_event_three.invites.create(pet_id: 4, message: "Hello!")

