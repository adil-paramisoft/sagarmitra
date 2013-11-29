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
             {name: 'school-volunteer'},
             {name: 'program-volunteer'}
             ])
puts " -- Done!"
puts " -- Creating Program States"
             
ActiveRecord::Base.connection.execute("TRUNCATE TABLE PROGRAM_STATES RESTART IDENTITY;")

ProgramState.create([     {name: 'Identified', description: ''},
                          {name: 'Shot Listed', description: ''},
                          {name: 'Contacted', description: ''},
                          {name: 'Engaged', description: ''},
                          {name: 'First Meeting Done', description: ''},
                          {name: 'Approved', description: ''},
                          {name: 'Teachers Presentation Done', description: ''},
                          {name: 'Children Presentation Done', description: ''},
                          {name: 'Collection Started', description: ''},
                          {name: 'Collection problem', description: ''},
                          {name: 'Training Problem', description: ''},
                          {name: 'Need Traing Lecture', description: ''},
                          {name: 'Re-Training Done', description: ''},
                          {name: 'Ocean Patch Assigned', description: ''},
                          {name: 'Ocean Patch Removed', description: ''},
                          {name: 'Collection Stopped', description: ''},
                          {name: 'Need Volunteers', description: ''},
                          {name: 'Need Plastic Collector', description: ''}])
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

PresentationType.create([{name: 'School Decision makers', description: ''},
                         {name: 'Teachers', description: ''},
                         {name: 'Chindren', description: ''},
                         {name: 'Partners', description: ''},
                         {name: 'Government', description: ''}])
puts " -- Done!"

puts " -- Creating School Mediums "
ActiveRecord::Base.connection.execute("TRUNCATE TABLE SCHOOL_MEDIA RESTART IDENTITY;")

SchoolMedium.create([{name: 'English', description: ''},
                         {name: 'Marathi', description: ''},
                         {name: 'Urdu', description: ''},
                         {name: 'Semi-English', description: ''}])
puts " -- Done!"

#  Run VACUUM command
# Importance: VACUUM reclaims storage occupied by dead tuples. In normal PostgreSQL operation, tuples that are deleted or obsoleted by an update are not physically removed from their table; they remain present until a VACUUM is done
# Initial inserts for roles

#ActiveRecord::Base.connection.execute("VACUUM")
admin_role = Role.find_or_create_by_name 'admin'
user = User.new(:email => 'chetan@paramisoft.com', :name => 'Chetan Jadhav', :password => 'welcome123')
user.roles << admin_role
user.save