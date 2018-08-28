# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tags = {
          name: %w(music performing-arts visual-arts fitness-wellness languages sports handwork fashion technology house-care animal-care gardening science engineering humanities)
      }


skills = {
          music: %w(singing guitar bass drums violin cello harmonica harp banjo ukelele piano percussion saxophone trumpet trombone flute clarinet tres lute mandolin recording staging music-theory DJing accordion rapping other),

          performing_arts: %w(dancing singing acting theatre musical-theatre comedy monologues magic illusion mime ventriloquism circus-arts other),

          visual_arts: %w(painting drawing sculpture printmaking design crafts ceramics photography video filmmaking architecture industrial-design graphic-design fashion-design interior-design decorative-art other)

          fitness_wellness: %w(weight-lifting running triathlon iron-man cycling swimming gymnastics aerobics water-aerobics yoga nutrition pilates stretching crossfit feldenkrais meditation walking jogging tai-chi qi-gong martial-arts other)
         }

         languages: %w(pronounciation public-speaking reading writing catalan mandarin spanish english hindi arabic portuguese bengali russian japanese punjabi german javanese malay korean telugu vietnamese french marathi tamil urdu turkish italian cantonese thai gujarati jin persian polish pashto kannada malayalam sudanese xiang hausa burmese ukranian filipino yoruba romanian greek swedish norwegian finnish danish slovak latvian belarusian czech hungarian other)
