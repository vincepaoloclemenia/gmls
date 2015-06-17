# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  {first_name: 'First User', last_name: 'Military', department: 0, email: 'csf@gmls.com',
   password: '12345678', password_confirmation: '12345678', gender: 'Male', role_id: 1},
  {first_name: 'Second User', last_name: 'Ship', department: 1, email: 'gmls@gmls.com',
   password: '12345678', password_confirmation: '12345678', gender: 'Male', role_id: 1}
])

Role.create(role_name: 'Administrator', description: 'Super Access to all modules')
