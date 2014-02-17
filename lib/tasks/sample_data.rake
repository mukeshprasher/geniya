namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_categories
    make_subcategories
    make_albums
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

    admin_default_album = admin.albums.build(name: "Default Album #{admin.username}", title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default")
    admin_default_album.save

    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@60degree.com"
      password  = "password"
      user = User.create!(name: name,
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

      user_default_album = user.albums.build(name: "Default Album #{user.username}", title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default")
      user_default_album.save
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
  
  def make_categories
      ['fashion','photography','fitness','culinary','entertainment'].each do |name| 
        Category.create!(name: name.capitalize)
      end
  end
  
  def make_subcategories
    Category.all.each do|cat|
      SubCategory.create!(name: "Glamour "+cat.name, category_id: cat.id)
      SubCategory.create!(name: "Famous "+cat.name, category_id: cat.id)
      SubCategory.create!(name: "Dynamic "+cat.name, category_id: cat.id)
    end
  end
  
  def make_albums
    User.all.each do|user|
      name = Faker::Lorem.words(rand(2..3)).join(' ')
      title = Faker::Lorem.words(rand(2..5)).join(' ')
      kind = ['album','project', 'portfolio'].sample
      para = Faker::Lorem.paragraph()
      Album.create!(user_id: user.id, name: name, title: title, description: para, kind: kind)
    end
  end
  
end
