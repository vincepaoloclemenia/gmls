# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  {first_name: 'GMLS', last_name: 'Administrator', department: 0, email: 'admin@gmls.com',
   password: 'password', password_confirmation: 'password', gender: 'Male', role_id: 1},

  {first_name: 'Encoder', last_name: 'Logreq', department: 1, email: 'enc_logreq@gmls.com',
   password: 'password', password_confirmation: 'password', gender: 'Female', role_id: 2},

  {first_name: 'Approver', last_name: 'Logreq', department: 1, email: 'app_logreq@gmls.com',
   password: 'password', password_confirmation: 'password', gender: 'Female', role_id: 3}

   {first_name: 'Encoder', last_name: 'RFQ', department: 1, email: 'enc_rfq@gmls.com',
   password: 'password', password_confirmation: 'password', gender: 'Female', role_id: 4},

  {first_name: 'Approver', last_name: 'RFQ', department: 1, email: 'app_rfq@gmls.com',
   password: 'password', password_confirmation: 'password', gender: 'Female', role_id: 5}

])

Role.create(role_name: 'Administrator', description: 'Super Access to all modules', access_level: 'Administrator')
Role.create(role_name: 'Data Encoder (LOGREQ)', description: 'Access the system as data encoder for Logistic Requirement.', access_level: 'Data Encoder')
Role.create(role_name: 'Approver (LOGREQ)', description: 'Access the system as Approver for all the entries created by data encoder in Logistic Requirement', access_level: 'Approver')
Role.create(role_name: 'Data Encoder (RFQ)', description: 'Access the system as data encoder for RFQ.', access_level: 'Data Encoder')
Role.create(role_name: 'Approver (RFQ)', description: 'Access the system as Approver for all the entries created by data encoder in RFQ', access_level: 'Approver')





