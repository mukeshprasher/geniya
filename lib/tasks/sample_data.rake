namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "mukesh.prashar@60degree.com",
                 password: "password",
                 username: "mukesh",
                 gender: "male",
                 summary: "helo",
                 height: 175,
                 bust: 32,
                 hips: 38,
                 shoes: 8,
                 hair:"black",
                 eyes:"brown",
                 birthdate: 23.years.ago,
                 available: "yes",
                 plan: "admin",
                 plan_end: Date.today + rand(1..6).months,
                 status: "active",
                 password_confirmation: "password")
    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@60degree.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   username: Faker::Internet.user_name,
                   gender: ['male','female'].sample,
                   summary: Faker::Lorem.sentence(4),
                   height: rand(150..180),
                   bust: rand(32..36),
                   hips: rand(32..36),
                   shoes:  rand(5..8),
                   hair: ['black','brown','red','blonde','brunette'].sample,
                   eyes: ['black','brown','blue','dark brown','green','light brown'].sample,
                   birthdate: rand(5840..7300).days.ago,
                   available: ['yes','no','probably','busy'].sample,
                   plan:  ['deluxe','trial'].sample,
                   plan_end: Date.today + rand(1..6).months,
                   status: ['active','inactive','deleted','hold'].sample
                   )
    end

    users = User.all(limit: 10)
    25.times do
      text = Faker::Lorem.sentence(5)
      receiver_user_id = rand(1..10)
      privacy = ['public','private', 'connections'].sample
      users.each { |user| user.updates.create!(text: text, receiver_user_id: receiver_user_id) }
    end
  end
end

