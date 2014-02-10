namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end

  def make_users
    admin =     User.create!(name: "geniya User",
                 email: "geniya@60degree.com",
                 password: "password",
                 username: "geniya",
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
    20.times do |n|
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
  end

  def make_microposts
    users = User.all(limit: 20)
    5.times do
      text = Faker::Lorem.sentence(5)
      receiver_user_id = rand(1..10)
      privacy = ['public','private', 'connections'].sample
      users.each { |user| user.updates.create!(text: text, receiver_user_id: receiver_user_id) }
    end
  end

  def make_relationships
    users = User.all
    user  = users.first
    followed_users = users[2..10]
    followers      = users[3..15]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each      { |follower| follower.follow!(user) }
  end
end

