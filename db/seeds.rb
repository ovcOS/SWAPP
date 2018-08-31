require 'open-uri'

puts "Seeding tags"
tags = {
          name: %w(music performing_arts visual_arts fitness_wellness languages sports extreme_sports handwork DIY fashion technology house_care animal_care gardening science engineering humanities)
      }

# generate tags
tags[:name].each do |tag|
  Tag.create(name: tag)
end

puts "Seeding skills"
skills = {
          music: %w(singing guitar bass drums violin cello harmonica harp banjo ukelele piano percussion saxophone trumpet trombone flute clarinet tres lute mandolin recording staging music-theory DJing accordion rapping),

          performing_arts: %w(dancing singing acting theatre musical-theatre comedy monologues magic illusion mime ventriloquism circus-arts),

          visual_arts: %w(painting drawing sculpture printmaking design crafts ceramics photography video filmmaking architecture industrial-design graphic-design fashion-design interior-design decorative-art),

          fitness_wellness: %w(weight-lifting running triathlon iron-man cycling swimming gymnastics aerobics water-aerobics yoga nutrition pilates stretching crossfit feldenkrais meditation walking jogging tai-chi qi-gong martial-arts),

         languages: %w(pronounciation public-speaking reading writing grammar spelling catalan mandarin spanish english hindi arabic portuguese bengali russian japanese punjabi german javanese malay korean telugu vietnamese french marathi tamil urdu turkish italian cantonese thai gujarati jin persian polish pashto kannada malayalam sudanese xiang hausa burmese ukranian filipino yoruba romanian greek swedish norwegian finnish danish slovak latvian belarusian czech hungarian),

         sports: %w(gymnastics cheerleading dancing gliding sky-diving base-jumping archery badminton football american-football rugby padel ping-pong tennis beach-tennis volleyball beach-volleyball basketball baseball softball cricket skateboarding scootering snowboarding skiing surfing windsurfing wakesurfing bodyboarding kitesurfing climbing hiking cycling BXM wrestling boxing martial-arts airsoft laser-tag paintball billiards equine-sports fishing flying-disc-sports golf handball hockey basque-pelota running sailing free-running parkour canoeing kayaking rafting rowing scuba-diving cliff-diving weight-lifting calisthenics auto-racing karting motorcycle-racing chess lacrosse),

         extreme_sports: %w(gliding sky-diving base-jumping snowboarding skiing frestyle-skiing high-mountain-skiing surfing windsurfing wakesurfing kitesurfing climbing parkour rafting cliff-diving auto-racing motorcycle-racing),

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
  url = "https://randomuser.me/api/"
  user_api = open(url).read
  api_fields = JSON.parse(user_api)
  name = api_fields["results"][0]["name"]["first"] + " " + api_fields["results"][0]["name"]["last"]
  email = api_fields["results"][0]["email"]
  picture = api_fields["results"][0]["picture"]["large"]
  location = 'Barcelona, Spain'
  new_user = User.create(name: name, email: email, password: password, location: location, remote_profile_photo_url: picture)
   rand(1..3).times do
    skill = Skill.all.sample
    unless new_user.skills.include? skill
      new_user.skills << skill
    end
  end
}

puts "Ready to rumble!"


