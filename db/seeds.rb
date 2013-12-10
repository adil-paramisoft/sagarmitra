# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ActiveRecord::Base.connection.execute("TRUNCATE TABLE ROLES RESTART IDENTITY;")

puts " -- Creating roles"

Role.create([{name: 'admin', description: 'Super admin of the app'},
             {name: 'school-admin', description: 'Admin for school'},
             {name: 'school-volunteer',description: 'volunteer for school'},
             {name: 'program-volunteer',description: 'volunteer for program'}
             ])
puts " -- Done!"
puts " -- Creating Program States"
             
ActiveRecord::Base.connection.execute("TRUNCATE TABLE PROGRAM_STATES RESTART IDENTITY;")

ProgramState.create([     {name: 'Identified', description: 'Identified'},
                          {name: 'Shot Listed', description: 'Shot Listed'},
                          {name: 'Contacted', description: 'Contacted'},
                          {name: 'Engaged', description: 'Engaged'},
                          {name: 'First Meeting Done', description: 'First Meeting Done'},
                          {name: 'Approved', description: 'Approved'},
                          {name: 'Teachers Presentation Done', description: 'Teachers Presentation Done'},
                          {name: 'Children Presentation Done', description: 'Children Presentation Done'},
                          {name: 'Collection Started', description: 'Collection Started'},
                          {name: 'Collection problem', description: 'Collection problem'},
                          {name: 'Training Problem', description: 'Training Problem'},
                          {name: 'Need Traing Lecture', description: 'Need Traing Lecture'},
                          {name: 'Re-Training Done', description: 'Re-Training Done'},
                          {name: 'Ocean Patch Assigned', description: 'Ocean Patch Assigned'},
                          {name: 'Ocean Patch Removed', description: 'Ocean Patch Removed'},
                          {name: 'Collection Stopped', description: 'Collection Stopped'},
                          {name: 'Need Volunteers', description: 'Need Volunteers'},
                          {name: 'Need Plastic Collector', description: 'Need Plastic Collector'}])
puts " -- Done!"

puts " -- Creating School Types"
ActiveRecord::Base.connection.execute("TRUNCATE TABLE SCHOOL_TYPES RESTART IDENTITY;")


SchoolType.create([{name: 'Primary', description: 'Std. 0 to 4'},
                   {name: 'Secondary', description: 'Std. 5 to 10'},
                   {name: 'Higher Secondary', description: 'Std. 11 to 12'},
                   {name: 'Primary and Secondary', description: 'Std. 0 to 10'},
                   {name: 'Primary, Secondary and HSC', description: 'Std. 0 to 12'}])
puts " -- Done!"


puts " -- Creating Presentation Types"
ActiveRecord::Base.connection.execute("TRUNCATE TABLE PRESENTATION_TYPES RESTART IDENTITY;")

PresentationType.create([{name: 'School Decision makers', description: 'School Decision makers'},
                         {name: 'Teachers', description: 'Teachers'},
                         {name: 'Chindren', description: 'Chindren'},
                         {name: 'Partners', description: 'Partners'},
                         {name: 'Government', description: 'Government'}])
puts " -- Done!"

puts " -- Creating School Mediums "
ActiveRecord::Base.connection.execute("TRUNCATE TABLE SCHOOL_MEDIA RESTART IDENTITY;")

SchoolMedium.create([{name: 'English', description: 'English'},
                         {name: 'Marathi', description: 'Marathi'},
                         {name: 'Urdu', description: 'Urdu'},
                         {name: 'Semi-English', description: 'Semi-English'}])
puts " -- Done!"

#  Run VACUUM command
# Importance: VACUUM reclaims storage occupied by dead tuples. In normal PostgreSQL operation, tuples that are deleted or obsoleted by an update are not physically removed from their table; they remain present until a VACUUM is done
# Initial inserts for roles

#ActiveRecord::Base.connection.execute("VACUUM")
admin_role = Role.find_or_create_by_name 'admin'
user = User.new(:email => 'chetan@paramisoft.com', :name => 'Chetan Jadhav', :password => 'welcome123')
user.roles << admin_role
user.save