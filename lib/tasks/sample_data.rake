namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_categories
    make_subcategories
    make_users
    make_microposts
    make_relationships
    make_albums
  end

  def make_users
    admin =     User.create!(name: "geniya User",
                 category: Category.first,
                 sub_category: SubCategory.first,
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
                    
    admin_default_album = admin.albums.build(name: "Default Album #{admin.username}", title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default", category_id: Category.all.sample.id)
    admin_default_album.save

    mg =     User.create!(name: "M G",
                 category: Category.first,
                 sub_category: SubCategory.first,
                 email: "mg@geniya.com",
                 password: "mgpass12",
                 username: "mg",
                 gender: "male",
                 summary: "hello",
                 birthdate: 23.years.ago,
                 available: "yes",
                 plan: "admin",
                 plan_end: Date.today + rand(1..6).years,
                 status: "active",
                 password_confirmation: "mgpass12")
    mg_default_album = mg.albums.build(name: "Default Album #{mg.username}", title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default", category_id: Category.all.sample.id)
    mg_default_album.save

    neeraj =     User.create!(name: "Neeraj Singh",
                 category: Category.first,
                 sub_category: SubCategory.first,
                 email: "neeraj.singh@60degree.com",
                 password: "neerajpass12",
                 username: "neeraj",
                 gender: "male",
                 summary: "hello",
                 birthdate: 23.years.ago,
                 available: "yes",
                 plan: "admin",
                 plan_end: Date.today + rand(1..6).years,
                 status: "active",
                 password_confirmation: "neerajpass12")
    neeraj_default_album = neeraj.albums.build(name: "Default Album #{neeraj.username}", title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default", category_id: Category.all.sample.id)
    neeraj_default_album.save

    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@60degree.com"
      password  = "password"
      user = User.create!(name: name,
                   category: Category.first,
                   sub_category: SubCategory.first,
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
    user_default_album = user.albums.build(name: "Default Album #{user.username}", title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default",category_id: Category.all.sample.id)
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
    order = 1
    ['Fashion Beauty','Photography Modelling', 'Arts', 'Travel Leisure','Fitness', 'Culinary','Entertainment'].each do |name| 
      Category.create!(name: name, order: order)
      order += 1
    end
  end
  
  def make_subcategories
    ['Costume Designer','Diamond cutter','Fashion Designer','Fashion Director','Fashion Photographer','Fashion Show Coordinator','Fashion Show Director','Fashion Writer','Jewelry Designer','Seamstress','Shoe Designer','Stylist','Tailor','Textile designer','Textile Designer','Wedding Gown Designer','Boutique Owner','Buyer','Clothing/Textile Distributor','Fashion Event Management','Fashion Journalism','Fashion/Trend Forecasting','Merchandiser','Public Relations','Retail Merchandise','Trade Show Director','Barber','Beautician','Bridal Hair','Cosmetic Surgery','Cosmetologist','Cosmetology Instructor','Cosmetology School Owner','Costume Makeup','Dermatologist','Esthetician','Hair Color Specialist','Hair Stylist','Make-up Artist','Massage Therapist','Perm Specialist','Research Chemist','Spa Treatment Specialist','Wedding Makeup','Wigmaker','Beauty product Distributor','Beauty School Owner','Business Consultant','Magazine Editor','Magazine Publisher','Magazine Writer','Product Developer','Sales Consultant','Salon Coordinator','Salon Franchisee','Salon Management','Salon Owner','Spa Owner','Beauty Industry','Fashion Industry' ].each do|sub_cat_name|
      SubCategory.create!(name: sub_cat_name, category_id: '1')
    end
    ['Aerial Photography','Architectural and Real Estate Photography','Baby and Child Photography','Boudoir/Nude Photography','Commercial Photography','Creative Director','Criminal Forensic Imaging Photography','Culinary Arts and Food Photography','Digital Photo Editing and Photo Retouching','Document and Archive Photography','Editorial Photography','Event Photography','Fashion Photography','Film Critic','Fitness Photography','Glamour Photography','Marine and Underwater Photography and Film Specialists','Medical Photography','Nature Photography','Newspaper and Magazine Photojournalism','Outdoor Photography','Pet','Animal and Wildlife Photography','Photographic Artists','Technicians and Assistants','Police and Law Enforcement Photography','Portrait and Family Photography','Scientific photography and Educational Imaging Specialists','Special Effects (F/X) Photography','Sports and Adventure Photography','Stock Photography','Travel Photography','Video Editor','Video Special Effects','Videographer','War Correspondent / Photographer','Wedding Photography','Alternative Modelling','Body Extremity modelling','Casual/Lifestyles Modelling','Commercial Modelling','Commercial Print Modelling','Corporate Modelling','Editorial Modelling','Fitness Modelling','Glamour Modelling','Lingerie Modelling','Modelling Representation/Agency','Nude Modelling','Promotional Modelling','Runway Modelling','Special Event Modelling','Swimwear Modelling','Youth Modelling','Modelling','Photography'].each do|sub_cat_name|
      SubCategory.create!(name: sub_cat_name, category_id: '2')
    end
    
    ['Architecture','Artistic Choreography','Author','Composer','Illustrator','Painter','Sculptor','Body Art/Painting','Cartoonist','Collage','Comic Book Artist','Drawing','Furniture Designer','Greeting Card Designer','Installation Art','Mixed Media','Packaging Designer','Police Sketch Artist','Printing','Scrapbooking','Sign Making','Street Art','Typography','3D Art','Animation','App Development','Drawing & Paintings','Font Designer','Graphic Design','Mixed Media','Typography','Vector','Video Game Development','Web Designer','Art Auctioneer','Art Critic','Art Dealer','Art Historian','Art Teacher','Arts Editor','Consultant','Curator','Festival Coordinator','Gallery Representative','Publisher','Restoration','Basketry and weaving','Cabinetry','Ceramics','Dolls and Toys','Glass Blowing','Glasswork','Jewelry','Leatherwork','Metalwork','Mosaic Artist','Paper Craft','Pottery','Stain glass Artist','Woodwork','Art - Business','Artisan/Crafts','Digital Arts','Fine Arts','Traditional Art'].each do|sub_cat_name|
      SubCategory.create!(name: sub_cat_name, category_id: '3')
    end
    
    ['Auto Club Travel Manager','Bed & Breakfast Operator','Chalet Manager','Concierge','Conference Organiser','Corporate Travel Consultant','Cruise Ship Director','Cruise ship Entertainment','Cruise Ship Worker','Flight Attendant','Holiday Representative','Hotel Management','Interpreter','Pilot','Tour Guide','Tourism Specialist','Travel Agent','Adventure Tourism','Campground Operator','Casino Dealer','Casino Slot attendant','Fishing','Florist','Gardener','Golf Club Management','Hunting guide','Landscaping','Language Instructor','Personal driver','Ski Hill Operator','Leisure','Travel'].each do|sub_cat_name|
      SubCategory.create!(name: sub_cat_name, category_id: '4')
    end
    
    ['Aerobics','Body Building','Boot camp','Boxing','Cross-fit','Dietician','Fitness center Management','Gym Owner','Health Club Manager','Kick-boxing','Martial Arts','Personal Training','Physical Education Teacher','Pilates','Pole Fitness','Spinning','Strength and Conditioning Coach','Wellness Coordinator','Wrestling','Yoga Instructor','Youth Fitness Specialist','Zumba','Acupuncture','Aquatic therapist','Chiropractor','Massage Therapist','Meditation','Nutritionist','Amateur Athlete','Amateur Scout','Athletic Trainer','Fitness Equipment','Physical Therapy','Professional Athlete','Professional scout','Sport Admin','Sport marketer','Sport Nutritionist','Sport Official','Sport Physiologist','Sporting Event Manager','Sports Coach','Sports Management','Sports Public Relations','Health','Physical Fitness','Sport'].each do|sub_cat_name|
      SubCategory.create!(name: sub_cat_name, category_id: '5')
    end
        
    ['Bar Consultant','Bartender','Catering Services','Convention Facilities','Culinary Equipment Provider','Hostess','Hotel Bar','Hotel Restaurant','Kitchen Designer','Menu Design','Mixologist','Restaurant Design','Server','Bakery/Pastry','Banquet Chefs','Bread Baker','Butcher','Cake Design','Cheese Maker','Chocolatiers','Coffee Connoisseur','Deli Owner','Herb and Specialty Crop Specialist','Kosher','Olive Oil Appraiser','Personal Chef','Personal Chefs','Pizza Chef','Red Seal Chefs','Scotch Taster','Sommelier','Sous-Chef','Sushi Chefs','Tea Taster','Water Connoisseur','Cookbook Author','Culinary Institute','Fine Dining Experience','Food Blogger','Food Critic','Food Stylist','Fortune Cookie Message Writer','Wine Representative','Hospitality','Other','Specialized'].each do|sub_cat_name|
      SubCategory.create!(name: sub_cat_name, category_id: '6')
    end
    ['Adult Entertainer','Bartenders','Beer Tub girls','Bottle Service Girl','Casino Dealer','Casino Management','Casino Owner','Casino Slot Attendant','DJ','Flair Bartenders','Go Go Dancers','Host/Hostess','Hostess','Mixologists','Nightclub Manager','Nightclub Owner','Nightclub Security','Promo Girl','Servers','Shooter Girl','Bridal Consultant','Bridal Salon Owner','Officiant','Venue Owner','Wedding Band','Wedding Cake Baker/Decorator','Wedding Florist','Wedding Planners','Advertising','Bartending School','Commercial Production','Marketing','Promotion','Public Relations','Acting Coach','Butler','Festivals','Radio','Singing Coach','Stunt Work','Acrobats','Arial silk','Burlesque Dancers','Clowns','Contortionist','Fire Breathers/Fire Eaters','Fortune Telling','Juggler','Magicians','Palm Reading','Plate Spinning','Stilts','Sword Swallower','Tight rope Walker','Trapeze','Wild Animal Tamer','Music Producer','Musician','Post Production','Singer','Songwriter','Sound Technician','Studio Owner','Actors','Casting','Director','House Manager','Lightboard Operator','Lighting Designer','Orchestra Manager','Props Manager','Publicity Manager','Scenic Artists / Set Painter','Set Designer','Stage Manager','Soundboard Operator','Technical Director','Theater Owner','Actors','Casting','Casualty Simulation','Creature Design','Field Reporter','News Anchor','Production and Development','Sound and Lighting','Sports newscaster','TV Network','TV Station ','Weather Reporter','Web Design/Development','Writing,Entertainment – Business','Film/Television','Miscellaneous','Music','Nightlife','Specialized Acts','Theatre','Weddings'].each do |sub_cat_name|
      SubCategory.create!(name: sub_cat_name, category_id: '7')
    end    


  end
  
  def make_albums
    User.all.each do|user|
      name = Faker::Lorem.words(rand(2..3)).join(' ')
      title = Faker::Lorem.words(rand(2..5)).join(' ')
      para = Faker::Lorem.paragraph()
      Album.create!(user_id: user.id, name: name, title: title, description: para, kind: "portfolio", category_id:  Category.all.sample.id)
    end
  end
  
end
