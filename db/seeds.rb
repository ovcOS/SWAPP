require 'open-uri'

puts "Seeding tags"
tags = {
          name: %w(music performing_arts visual_arts fitness_wellness languages sports water_sports ball_sports snow_sports extreme_sports martial_arts crafting technology beauty house_care animal_care science engineering humanities cuisine  earth_sciences)
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

          fitness_wellness: %w(weight-lifting running triathlon cycling swimming gymnastics aerobics water-aerobics yoga nutrition pilates stretching crossfit feldenkrais meditation walking jogging tai-chi qi-gong martial-arts medicine physiotherapy occupatinal-therapist chiropractic psychology),

          languages: %w(pronounciation public-speaking reading writing grammar spelling catalan mandarin spanish english hindi arabic portuguese bengali russian japanese punjabi german javanese korean vietnamese french turkish italian cantonese thai polish xiang ukranian filipino romanian greek swedish norwegian finnish danish slovak latvian belarusian czech hungarian),

          sports: %w(gymnastics cheerleading track-and-field dancing gliding sky-diving base-jumping archery badminton football american-football rugby padel ping-pong tennis beach-tennis volleyball beach-volleyball basketball baseball softball cricket skateboarding scootering snowboarding skiing surfing windsurfing wakesurfing bodyboarding kitesurfing climbing hiking cycling BXM wrestling boxing airsoft laser-tag paintball billiards equine-sports fishing flying-disc-sports golf handball hockey basque-pelota running sailing free-running parkour canoeing kayaking rafting rowing scuba-diving cliff-diving weight-lifting calisthenics auto-racing karting motorcycle-racing chess lacrosse bowling swimming water-polo),

          water_sports: %w(surfing windsurfing wakesurfing bodyboarding kitesurfing water-polo water-aerobics swimming scuba-diving cliff-diving),

          ball_sports: %w(football american-football rugby padel ping-pong tennis beach-tennis volleyball beach-volleyball basketball baseball softball cricket basque-pelota bowling),

          snow_sports: %w(snowboarding skiing),

          extreme_sports: %w(gliding sky-diving base-jumping snowboarding skiing frestyle-skiing high-mountain-skiing surfing windsurfing wakesurfing kitesurfing climbing parkour rafting cliff-diving auto-racing motorcycle-racing),

          martial_arts: %w(martial-arts MMA taekwondo jiujitsu muay-thai krav-maga karate judo kickboxing aikido capoeira),

          crafting: %w(sowing woodworking scrap-booking decoupage knitting origami leather-crafting sculpture soapmaking candlemaking welding carpentry),

          beauty: %w(fashion-design makeup hairdressing),

          house_care: %w(wall-painting gardening carpentry feng-shui interior-design cleaning woodworking),

          animal_care: %w(veterinary pet-training dog-training cat-training exotic-animal-care),

          science: %w(chemistry physics mathematics astronomy biology biochemistry pharmacology medicine physiotherapy botany psychology geology ecology oceanography zoology human-biology botany social-science computer-science data-science veterinary engineering),

          earth_sciences: %w(ecology geology oceanography zoology human-biology botany),

          technology: %w(programming computer-science robotics engineering data-science),

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
    tag = Tag.where(name: tag_name)
    skill.tags << tag
  end
end

# generate random character password
password = (0..5).map { (65 + rand(26)).chr }.join

puts "Seeding users"

# generate users
100.times  {
  url = "https://randomuser.me/api/?inc=name,\%20picture,\%20email"
  user_api = open(url).read
  api_fields = JSON.parse(user_api)
  name = api_fields["results"][0]["name"]["first"] + " " + api_fields["results"][0]["name"]["last"]
  email = api_fields["results"][0]["email"]
  picture = api_fields["results"][0]["picture"]["large"]
  location = 'Barcelona, Spain'
  new_user = User.create(name: name, email: email, password: password, location: location, profile_photo: picture)
   rand(1..3).times do
    skill = Skill.all.sample
    unless new_user.skills.include? skill
      new_user.skills << skill
    end
  end
}

puts "Ready to rumble!"


