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
