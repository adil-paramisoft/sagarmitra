# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class SchoolSeeds

  School.create([{name:'St. Andrews Chinchwad',
                         address: 'Block D 3, MIDC, Chinchwad, Pune - 411033',
                         number_of_collections: 5,
                         plastic_collected: 1599,
                         green_fund: 12792,
                         school_type_id: 2,
                         program_state_id: 9,
                         school_medium_id: 1,
                         total_students: 2000},
                     {name: 'St. Ursulas Nigdi',
                      address: 'Akurdi, Pune - 411035',
                      number_of_collections: 7,
                      plastic_collected: 1016,
                      green_fund: 8121,
                      school_type_id: 2,
                      program_state_id: 9,
                      school_medium_id: 1,
                      total_students: 2000},
                     {name:'St. Vincent’s – Camp',
                      address: 'Survey No 2005/2006, Near Shivaji Market, St Vincents Street, Camp, Pune - 411001',
                      number_of_collections: 4,
                      plastic_collected: 796,
                      green_fund: 6368,
                      school_type_id: 2,
                      program_state_id: 9,
                      school_medium_id: 1,
                      total_students: 2000},
                     {name: 'Paranjape School - Kothrud ',
                      address: 'Survey No 40 Hissa No 1 To 3, Near Kothrud Telephone Exchange, Kothrud Depot, Pune - 411038',
                      number_of_collections: 6,
                      plastic_collected: 443,
                      green_fund: 3544,
                      school_type_id: 2,
                      program_state_id: 9,
                      school_medium_id: 1,
                      total_students: 2000},
                     {name: 'Mahesh Vidyalaya- Kothrud',
                      address: 'Survey No 50 15/2 Nalawade Baug Gananjay Society, Near Springfield Society Opposite Ashish Garden, New D P Road, Kothrud Depot, Pune - 411038',
                      number_of_collections: 3,
                      plastic_collected: 112,
                      green_fund: 896,
                      school_type_id: 2,
                      program_state_id: 9,
                      school_medium_id: 1,
                      total_students: 800},
                     {name: 'Vidyaniketan School - Kothrud',
                      address: 'Survey No 634/9 A/1, Bibvewadi, Pune - 411037',
                      number_of_collections: 2,
                      plastic_collected: 89,
                      green_fund: 712,
                      school_type_id: 2,
                      program_state_id: 9,
                      school_medium_id: 1,
                      total_students: 800},
                     {name: 'Saraswati Mandir ',
                      address: '1359, Bajirao Rd, Shukrawar Peth, Pune - 411002',
                      number_of_collections: 2,
                      plastic_collected: 89,
                      green_fund: 712,
                      school_type_id: 2,
                      program_state_id: 9,
                      school_medium_id: 1,
                      total_students: 800},
                     {name: 'Modern High School',
                      address: 'Modern High School English Medium, Nigdi, Pune-411044',
                      number_of_collections: 1,
                      plastic_collected: 125,
                      green_fund: 1000,
                      school_type_id: 2,
                      program_state_id: 9,
                      school_medium_id: 1,
                      total_students: 850}])




plastic_collection =  PlasticCollectionEvent.create([{plastic_weight: 1599,money_given: 12792,
                    volunteers_present: "Around 10",plastic_collection_source_id: 1,quality_remark: "Good",
                    school_id: School.find_or_create_by(:name =>'St. Andrews Chinchwad').id,
                    start_at: 2.days.ago,end_at: Date.today.to_s,
                    photos: Photo.create([:image => File.new(Rails.root + "db/seeds/images/st_andrew.jpg")])}])
  plastic_collection.upload_flickr_photos

  plastic_collection.save


=begin


  PlasticCollectionEvent


  school=School.new(:name => 'St. Ursulas Nigdi',
                    :address => 'Akurdi, Pune - 411035',
                    :number_of_collections => 7,
                    :plastic_collected => 1016,
                    :green_fund => 8121,
                    :school_type_id => 2,
                    :program_state_id => 9,
                    :school_medium_id => 1,
                    :total_students => 2000,
                    :photo =>Photo.create(:image => File.new(Rails.root + "app/assets/images/school.jpg"))
  )
  school.upload_flickr_photo
  school.save


  school=School.new(:name => 'St. Vincent’s – Camp',
                    :address => 'Survey No 2005/2006, Near Shivaji Market, St Vincents Street, Camp, Pune - 411001',
                    :number_of_collections => 4,
                    :plastic_collected => 796,
                    :green_fund => 6368,
                    :school_type_id => 2,
                    :program_state_id => 9,
                    :school_medium_id => 1,
                    :total_students => 2000,:photo =>Photo.create(:image => File.new(Rails.root + "app/assets/images/school.jpg"))
  )
  school.upload_flickr_photo
  school.save


  school=School.new(:name => 'Paranjape School - Kothrud ',
                    :address => 'Survey No 40 Hissa No 1 To 3, Near Kothrud Telephone Exchange, Kothrud Depot, Pune - 411038',
                    :number_of_collections => 6,
                    :plastic_collected => 443,
                    :green_fund => 3544,
                    :school_type_id => 2,
                    :program_state_id => 9,
                    :school_medium_id => 1,
                    :total_students => 2000,:photo =>Photo.create(:image => File.new(Rails.root + "app/assets/images/school.jpg"))
  )
  school.upload_flickr_photo
  school.save


  School.where(:name => 'Mahesh Vidyalaya- Kothrud',
               :address => 'Survey No 50 15/2 Nalawade Baug Gananjay Society, Near Springfield Society Opposite Ashish Garden, New D P Road, Kothrud Depot, Pune - 411038',
               :number_of_collections => 3,
               :plastic_collected => 112,
               :green_fund => 896,
               :school_type_id => 2,
               :program_state_id => 9,
               :school_medium_id => 1,
               :total_students => 800,:photo =>Photo.create(:image => File.new(Rails.root + "app/assets/images/school.jpg"))
  )
  school.upload_flickr_photo
  school.save

  School.where(:name => 'Vidyaniketan School - Kothrud',
               :address => 'Survey No 634/9 A/1, Bibvewadi, Pune - 411037',
               :number_of_collections => 2,
               :plastic_collected => 89,
               :green_fund => 712,
               :school_type_id => 2,
               :program_state_id => 9,
               :school_medium_id => 1,
               :total_students => 800,:photo =>Photo.create(:image => File.new(Rails.root + "app/assets/images/school.jpg"))
  )
  school.upload_flickr_photo
  school.save
  School.where(:name => 'Saraswati Mandir ',
               :address => '1359, Bajirao Rd, Shukrawar Peth, Pune - 411002',
               :number_of_collections => 2,
               :plastic_collected => 89,
               :green_fund => 712,
               :school_type_id => 2,
               :program_state_id => 9,
               :school_medium_id => 1,
               :total_students => 800,:photo =>Photo.create(:image => File.new(Rails.root + "app/assets/images/school.jpg"))
  )
  school.upload_flickr_photo
  school.save
  School.where(:name => 'Modern High School Nigadi',
               :address => 'Modern High School English Medium, Nigdi, Pune-411044',
               :number_of_collections => 1,
               :plastic_collected => 125,
               :green_fund => 1000,
               :school_type_id => 2,
               :program_state_id => 9,
               :school_medium_id => 1,
               :total_students => 850,:photo =>Photo.create(:image => File.new(Rails.root + "app/assets/images/school.jpg"))
  )
  school.upload_flickr_photo
  school.save
=end
end