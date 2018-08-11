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


Role.delete_all()
MembershipType.delete_all()
Room.delete_all()
GymClassCategory.delete_all()

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

membership_type1.save()
membership_type2.save()

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
