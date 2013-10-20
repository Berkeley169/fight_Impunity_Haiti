# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(:name => 'the_admin', :email => 'email@domain.com', :password => 'the_admin', :password_confirmation => 'the_admin', :remember_me => false, :role => 'Manager', :lang => 'English')
