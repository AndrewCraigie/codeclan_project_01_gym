require ('pry')
require ('date')
require_relative ('../models/role')
require_relative ('../models/membership_type')
require_relative ('../models/room')
require_relative ('../models/song')
require_relative ('../models/intensity')
require_relative ('../models/gym_class_category')
require_relative ('../models/membership')
require_relative ('../models/person')
require_relative ('../models/gym_class')
require_relative ('../models/session')
require_relative ('../models/person_session')
require_relative ('../models/person')
require_relative ('../models/message')
require_relative ('../models/payment')
require_relative ('../models/person_membership')
require_relative ('../models/gym_classes_category')
require_relative ('../models/playlist_song')

PersonSession.delete_all()
Session.delete_all()

GymClassesCategory.delete_all()
PersonMembership.delete_all()
Person.delete_all()
Message.delete_all()
Payment.delete_all()
GymClass.delete_all()
PlaylistSong.delete_all()
Membership.delete_all()

Role.delete_all()
MembershipType.delete_all()
Room.delete_all()
GymClassCategory.delete_all()
Intensity.delete_all()
Song.delete_all()

role1 = Role.new({
  'name' => 'customer'
  })

role2 = Role.new({
  'name' => 'employee'
  })

role1.save()
role2.save()

membership_type1 = MembershipType.new({
  'name' => 'standard',
  'description' => 'Standard memberhip'
  })

membership_type2 = MembershipType.new({
  'name' => 'premium',
  'description' => 'Premium memberhip'
  })


membership_type3 = MembershipType.new({
  'name' => 'employee',
  'description' => 'Staff memberhip'
})

membership_type1.save()
membership_type2.save()
membership_type3.save()

room1 = Room.new({
  'name' => 'Studio 1'
  })
room2 = Room.new({
  'name' => 'Studio 2'
  })
room3 = Room.new({
  'name' => 'Studio 3'
  })
room4 = Room.new({
  'name' => 'Studio 4'
  })
room5= Room.new({
  'name' => 'Gym Hall 1'
  })
room6 = Room.new({
  'name' => 'Gym Hall 2'
  })

room1.save()
room2.save()
room3.save()
room4.save()
room5.save()
room6.save()


gym_class_category1 = GymClassCategory.new({
  'name' => 'Cardio',
  'description' => 'Get your heart beating'
  })

gym_class_category2 = GymClassCategory.new({
  'name' => 'Strength',
  'description' => 'Build those muscles'
})

gym_class_category3 = GymClassCategory.new({
  'name' => 'Tone',
  'description' => 'For a sleek and lean body'
})

gym_class_category4 = GymClassCategory.new({
  'name' => 'Stamina',
  'description' => 'Keep going for longer'
})

gym_class_category4 = GymClassCategory.new({
  'name' => 'Flexibility',
  'description' => 'Get supple and bendy'
})

gym_class_category5 = GymClassCategory.new({
  'name' => 'Wellbeing',
  'description' => 'Taking care of your inner and outer self'
})

gym_class_category6 = GymClassCategory.new({
  'name' => 'Combat',
  'description' => 'Get FITTING fit'
})

gym_class_category1.save()
gym_class_category2.save()
gym_class_category3.save()
gym_class_category4.save()
gym_class_category5.save()
gym_class_category6.save()

intensity1 = Intensity.new({
  'name' => 'Beginner'
  })
intensity2 = Intensity.new({
  'name' => 'Intermediate'
  })
intensity3 = Intensity.new({
  'name' => 'Advanced'
  })

intensity1.save()
intensity2.save()
intensity3.save()




song1 = Song.new({
'name' => "Till I Collapse",
'artist' => "Eminem (ft.Nate Dogg)",
'duration' => "00:04:57"
})

song2 = Song.new({
'name' => "Rockstar",
'artist' => "Post Malone (ft. 21 Savage)",
'duration' => "00:03:38"
})

song3 = Song.new({
'name' => "Lose Yourself",
'artist' => "Eminem",
'duration' => "00:05:26"
})

song4 = Song.new({
'name' => "HUMBLE",
'artist' => "Kendrick Lamar",
'duration' => "00:02:57"
})

song5 = Song.new({
'name' => "More Than You Know",
'artist' => "Axwell Ingrosso",
'duration' => "00:03:23"
})

song6 = Song.new({
'name' => "Mi Gente",
'artist' => "J Balvin (ft. Beyonce)",
'duration' => "00:03:29"
})

song7 = Song.new({
'name' => "Havana",
'artist' => "Camila Cabello",
'duration' => "00:03:37"
})

song8 = Song.new({
'name' => "You Don't Know Me",
'artist' => "Jax Jones (Radio edit)",
'duration' => "00:03:33"
})

song9 = Song.new({
'name' => "New Rules",
'artist' => "Dua Lipa (Initial Talk remix)",
'duration' => "00:03:44"
})

song10 = Song.new({
'name' => "POWER",
'artist' => "Kanye West",
'duration' => "00:04:52"
})

song11 = Song.new({
  'name' => 'Raise Your Hands',
  'artist' => 'Ummet Ozcan',
  'duration' => '00:04:26'
})

song1.save()
song2.save()
song3.save()
song4.save()
song5.save()
song6.save()
song7.save()
song8.save()
song9.save()
song10.save()
song11.save()

person1 = Person.new({
  'first_name' => "Helen",
  'last_name' => "Bruce",
  'street_address' => "123 Brown Street",
  'city' => "Glasgow",
  'postcode' => "G42 8PU",
  'telephone_number' => "0141 424 1234",
  'mobile_number' => "07743662806",
  'email_address' => "h.bruce@gmail.com",
  'photo_url' => "0001.jpg",
  'role_id' => role1.id
  })

person2 = Person.new({
  'first_name' => "Oiver",
  'last_name' => "Maxwell",
  'street_address' => "18 Thistle Place",
  'city' => "Glasgow",
  'postcode' => "G41 9PD",
  'telephone_number' => "0141 420 1234",
  'mobile_number' => "07543677780",
  'email_address' => "olivermax23@btinternet.com",
  'photo_url' => "0002.jpg",
  'role_id' => role2.id
  })

  person3 = Person.new({
    'first_name' => "Steven",
    'last_name' => "Adams",
    'street_address' => "9 Stewart Crescent",
    'city' => "Glasgow",
    'postcode' => "G12 0ES",
    'telephone_number' => "0141 214 1234",
    'mobile_number' => "07544677780",
    'email_address' => "sadams@sadams.co.uk",
    'photo_url' => "0003.jpg",
    'role_id' => role1.id
    })

person1.save()
person2.save()
person3.save()

membership1 = Membership.new({
  'membership_number' => 1,
  'start_date' => '2016-09-10',
  'end_date' => '2017-09-09',
  'membership_type_id' => membership_type1.id
})

membership2 = Membership.new({
  'membership_number' => 2,
  'start_date' => '2017-06-21',
  'end_date' => '2018-06-20',
  'membership_type_id' => membership_type2.id
})

membership3 = Membership.new({
  'membership_number' => 3,
  'start_date' => '2017-06-21',
  'end_date' => '2018-06-20',
  'membership_type_id' => membership_type3.id
})

membership1.save()
membership2.save()
membership3.save()

person_membership1 = PersonMembership.new({
  'person_id' => person1.id,
  'membership_id' => membership1.id
})

person_membership2 = PersonMembership.new({
  'person_id' => person3.id,
  'membership_id' => membership2.id
})

person_membership3 = PersonMembership.new({
  'person_id' => person2.id,
  'membership_id' => membership3.id
})

person_membership1.save()
person_membership2.save()
person_membership3.save()


gym_class1 = GymClass.new({
  'name' => 'Meta Fit',
  'description' => "Metafit is a high-intensity workout including a series of body-weight exercises with interval style training, designed to keep your body burning calories long after your training session is complete.\n
  Designed by a former marine, this is a class you can be sure to push your limits in.\n
  It’s only thirty minutes long, but you will train hard the entire time. It’s suitable for everyone and you can adjust the exercises to suit your own abilities.",
  'intensity_id' => intensity2.id
})

gym_class2 = GymClass.new({
  'name' => "Body Pump",
  'description' => "Using weights and repetitions, Body Pump is designed to sculpt, tone and strengthen.\n
  If you're feeling out of shape, this class will challenge and change your body for the better.\n
  This dynamic resistance training class gets all the muscle groups working, building strength and conditioning your body. Squat, lift and curl to music that will lift your spirits as you lift those weights.",
  'intensity_id' => intensity3.id
})

gym_class1.save()
gym_class2.save()

playlist_song1 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song1.id
})
playlist_song2 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song2.id
})
playlist_song3 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song3.id
})
playlist_song4 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song4.id
})
playlist_song5 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song5.id
})
playlist_song6 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song7.id
})
playlist_song7 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song7.id
})
playlist_song8 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song8.id
})
playlist_song9 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song9.id
})
playlist_song10 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song10.id
})
playlist_song11 = PlaylistSong.new({
  'gym_class_id' => gym_class1.id,
  'song_id' => song11.id
})
# Playlist 2

playlist_song12 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song2.id
})
playlist_song13 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song3.id
})
playlist_song14 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song4.id
})
playlist_song15 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song5.id
})
playlist_song16 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song7.id
})
playlist_song17 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song7.id
})
playlist_song18 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song8.id
})
playlist_song19 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song9.id
})
playlist_song20 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song10.id
})
playlist_song21 = PlaylistSong.new({
  'gym_class_id' => gym_class2.id,
  'song_id' => song11.id
})

playlist_song1.save()
playlist_song2.save()
playlist_song3.save()
playlist_song4.save()
playlist_song5.save()
playlist_song6.save()
playlist_song7.save()
playlist_song8.save()
playlist_song9.save()
playlist_song10.save()
playlist_song11.save()


playlist_song12.save()
playlist_song13.save()
playlist_song14.save()
playlist_song15.save()
playlist_song16.save()
playlist_song17.save()
playlist_song18.save()
playlist_song19.save()
playlist_song20.save()
playlist_song21.save()

gym_classess_category1 = GymClassesCategory.new({
  'class_id' => gym_class1.id,
  'gym_class_category_id' => gym_class_category1.id
})

gym_classess_category2 = GymClassesCategory.new({
  'class_id' => gym_class1.id,
  'gym_class_category_id' => gym_class_category4.id
})

gym_classess_category3 = GymClassesCategory.new({
  'class_id' => gym_class2.id,
  'gym_class_category_id' => gym_class_category1.id
})

gym_classess_category4 = GymClassesCategory.new({
  'class_id' => gym_class2.id,
  'gym_class_category_id' => gym_class_category6.id
})

gym_classess_category1.save()
gym_classess_category2.save()
gym_classess_category3.save()
gym_classess_category4.save()


message1 = Message.new({
  'message' => "You have been booked in to #{gym_class1.name}",
  'date_time_added' => Time.now(),
  'person_id' => person1.id
})


message1.save()


payment1 = Payment.new({
  'description' => "Priority booking supplement for #{gym_class1.name}",
  'amount' => '2.50',
  'person_id' => person3.id
})

payment1.save()

session1 = Session.new({
  'start_time' => '2018-8-12 15:30:00',
  'end_time' => '2018-8-12 16:20:00',
  'capacity' => '20',
  'gym_class_id' => gym_class2.id,  # Body Pump
  'instructor_id' => person2.id,
  'room_id' => room1.id
})

session1.save()

person_session1 = PersonSession.new({
  'date_time_added' => Time.now().to_s,
  'reserve' => 'FALSE',
  'person_id' => person1.id,
  'session_id' => session1.id
})

person_session1.save()
