# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users_data = [
  {
      username: 'dkob',
      fullname: 'Denys Kobylins\'kyi',
      email:    'dkob@softserveinc.com',
      password: 'password',
      is_admin: true
  },
  {
      username: 'dparsh',
      fullname: 'Dmytro Parshenko',
      email:    'dparsh@softserveinc.com',
      password: 'password',
      is_admin: true
  },
  {
      username: 'testuser',
      fullname: 'Test User',
      email:    'testuser@example.com',
      password: 'password',
      is_admin: false
  }
]

users_data.each do |data|
  u = User.new
  data.each { |k,v| u.send "#{k}=", v }
  u.save
end