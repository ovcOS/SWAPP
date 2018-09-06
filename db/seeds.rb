require 'open-uri'

puts "Seeding tags"
tags = {
          name: %w(music performing_arts visual_arts fitness_wellness languages sports water_sports ball_sports snow_sports extreme_sports martial_arts crafting technology beauty house_care animal_care science humanities cuisine earth_sciences social_sciences)
      }

# generate tags
tags[:name].each do |tag|
  Tag.create(name: tag)
end

puts "Seeding skills"
skills = {
          music: %w(singing guitar bass drums violin cello harmonica harp banjo ukelele piano percussion saxophone trumpet trombone flute clarinet cuban-tres lute mandolin music-recording staging music-theory music-production DJing accordion rapping music-performance),

          performing_arts: %w(dancing singing opera acting theatre musical-theatre comedy monologues magic illusion mime ventriloquism circus-arts juggling improv music-performance),

          visual_arts: %w(painting drawing sculpture printmaking design crafts ceramics photography video video-production filmmaking architecture industrial-design graphic-design fashion-design interior-design decorative-art),

          fitness_wellness: %w(weight-lifting running triathlon cycling swimming gymnastics aerobics water-aerobics yoga nutrition pilates stretching crossfit feldenkrais meditation walking jogging tai-chi qi-gong martial-arts medicine physiotherapy occupational-therapist chiropractic psychology),

          languages: %w(pronounciation public-speaking reading writing grammar spelling catalan mandarin spanish english hindi arabic portuguese bengali russian japanese punjabi german korean vietnamese french turkish italian cantonese thai polish xiang ukranian filipino romanian greek swedish norwegian finnish danish slovak latvian belarusian czech hungarian),

          sports: %w(gymnastics cheerleading track-and-field dancing gliding sky-diving base-jumping archery badminton football american-football rugby padel ping-pong tennis beach-tennis volleyball beach-volleyball basketball baseball softball cricket skateboarding scootering snowboarding skiing surfing windsurfing wakesurfing bodyboarding kitesurfing climbing hiking cycling BXM wrestling boxing airsoft laser-tag paintball billiards equine-sports fishing flying-disc-sports golf handball hockey basque-pelota running sailing free-running parkour canoeing kayaking rafting rowing scuba-diving cliff-diving weight-lifting calisthenics auto-racing karting motorcycle-racing chess lacrosse bowling swimming water-polo),

          water_sports: %w(surfing windsurfing wakesurfing bodyboarding kitesurfing water-polo water-aerobics swimming scuba-diving cliff-diving),

          ball_sports: %w(football american-football rugby padel ping-pong tennis beach-tennis volleyball beach-volleyball basketball baseball softball cricket basque-pelota bowling),

          snow_sports: %w(snowboarding skiing),

          extreme_sports: %w(gliding sky-diving base-jumping snowboarding skiing frestyle-skiing high-mountain-skiing surfing windsurfing wakesurfing kitesurfing climbing parkour rafting cliff-diving auto-racing motorcycle-racing),

          martial_arts: %w(martial-arts MMA taekwondo jiujitsu muay-thai krav-maga karate judo kickboxing aikido capoeira),

          crafting: %w(sewing woodworking scrap-booking decoupage knitting origami leather-crafting sculpture soapmaking candlemaking welding carpentry),

          beauty: %w(fashion-design makeup hairdressing),

          house_care: %w(wall-painting gardening carpentry feng-shui interior-design cleaning woodworking),

          animal_care: %w(veterinary pet-training dog-training cat-training exotic-animal-care),

          science: %w(chemistry physics mathematics astronomy biology biochemistry pharmacology medicine physiotherapy botany psychology geology ecology oceanography zoology human-biology social-science computer-science data-science veterinary),

          earth_sciences: %w(ecology geology oceanography zoology human-biology botany),

          technology: %w(programming computer-science robotics data-science),

          social_sciences: %w(anthropology communication economics education political-science psychology sociology),

          humanities: %w(social-science anthropology archaeology history literature philosophy),

          cuisine: %w(baking sushi-preparation pizza-making indian-cuisine asian-cuisine mediterranean-cuisine french-cuisine spanish-cuisine italian-cuisine american-cuisine)
         }

# associate tag to skills
skills.each do |tag_name, skill_names|
  skill_names.each do |skill_name|
    if Skill.where(name: skill_name).first
      skill = Skill.where(name: skill_name).first
    else
      skill = Skill.create(name: skill_name)
    end
    tag = Tag.where(name: tag_name).first
    skill.tags << tag unless skill.tags.include? tag
  end
end

# generate random character password
password = (0..5).map { (65 + rand(26)).chr }.join



names = {
  female_names: [ "Fredericka Epley", "Marguerita Etheridge", "Kylie Stanhope", "Priscilla Goosby", "Chara Brenneman", "Maegan Bement", "Lynsey Brimage", "Sara Corrao", "Grisel Jetter", "Laura Drewes", "Keshia Crofoot", "Anastasia Lowe", "Adelaida Bridgeman", "Maria Fellows", "Cherry Wieczorek", "Ashlee Decosta", "Elena Valles", "Lizzette Manalo", "Deanne Roye", "Rosa Ponset", "Christena Savant", "Dakota Gustavson", "Greta Ferrer", "Daisy Prinz", "Cecily Sarinana", "Thi Skyles"],

  male_names: [ "Ron Schuch", "Morris Fruchter", "Alexander Nicolai", "Roy Santelli", "Tracy Hessel", "Graham Tillett", "Arturo Branham", "Raymundo Kupfer", "Jose Saucedo", "Gabriel Voges", "Alberto Trigo", "Josep Torres", "Justin Stiverson", "Casey Paden", "Rickey Tuff", "Alan Waggoner", "Mariano Arteaga", "Branden Sobolik", "Maximo Hussey", "David Koprowski", "Tony Greaves", "Fernando Gonzalez", "Michael Shaver", "Sheldon Robinson", "Sylvester Byrom", "Enric Cortes"]
}

pictures = {
  female_pictures: [
    "https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?cs=srgb&dl=beautiful-brunette-cute-774909.jpg&fm=jpg",
    "https://images.pexels.com/photos/871495/pexels-photo-871495.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1102341/pexels-photo-1102341.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/206445/pexels-photo-206445.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/372042/pexels-photo-372042.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/457496/pexels-photo-457496.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/937483/pexels-photo-937483.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/354972/pexels-photo-354972.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/789822/pexels-photo-789822.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/950243/pexels-photo-950243.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/371160/pexels-photo-371160.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/790744/pexels-photo-790744.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/918457/pexels-photo-918457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/731070/pexels-photo-731070.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1084546/pexels-photo-1084546.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/879589/pexels-photo-879589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1065023/pexels-photo-1065023.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1102342/pexels-photo-1102342.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/235462/pexels-photo-235462.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1153370/pexels-photo-1153370.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1381558/pexels-photo-1381558.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/256639/pexels-photo-256639.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/681621/pexels-photo-681621.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/838579/pexels-photo-838579.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350"],

  male_pictures: [
    "https://images.pexels.com/photos/247885/pexels-photo-247885.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/936072/pexels-photo-936072.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/819482/pexels-photo-819482.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1080243/pexels-photo-1080243.png?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1121796/pexels-photo-1121796.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/713520/pexels-photo-713520.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1073097/pexels-photo-1073097.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/769745/pexels-photo-769745.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/724889/pexels-photo-724889.png?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/713829/pexels-photo-713829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/157966/person-young-man-beard-emotions-157966.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1047958/pexels-photo-1047958.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/935965/pexels-photo-935965.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1009874/pexels-photo-1009874.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/21278/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1292306/pexels-photo-1292306.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/395077/pexels-photo-395077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1306204/pexels-photo-1306204.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/16622/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1093070/pexels-photo-1093070.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1121359/pexels-photo-1121359.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1188047/pexels-photo-1188047.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1275380/pexels-photo-1275380.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/164762/pexels-photo-164762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350",
    "https://images.pexels.com/photos/1267348/pexels-photo-1267348.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350"]
}

puts "Seeding users. This may take a while."

# generate users
pictures[:female_pictures].each_with_index do |picture, index|
  name = names[:female_names][index]
  url = "https://randomuser.me/api/"
  user_api = open(url).read
  api_fields = JSON.parse(user_api)
  email = api_fields["results"][0]["email"]
  location = 'Barcelona, Spain'

  new_user = User.create(name: name, email: email, password: password, location: location, remote_profile_photo_url: picture)
   rand(1..3).times do
    skill = Skill.all.sample
    unless new_user.skills.include? skill
      new_user.skills << skill
    end
  end
end

pictures[:male_pictures].each_with_index do |picture, index|
  name = names[:male_names][index]
  url = "https://randomuser.me/api/"
  user_api = open(url).read
  api_fields = JSON.parse(user_api)
  email = api_fields["results"][0]["email"]
  location = 'Barcelona, Spain'

  new_user = User.create(name: name, email: email, password: password, location: location, remote_profile_photo_url: picture)
   rand(1..3).times do
    skill = Skill.all.sample
    unless new_user.skills.include? skill
      new_user.skills << skill
    end
  end
end

puts "Ready to rumble!"


