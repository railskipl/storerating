# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.find_or_create_by( :name => "business")
Role.find_or_create_by( :name =>  "customer")
Role.find_or_create_by( :name => "admin")
Plan.find_or_create_by( :name => "$250",:price => 250)
Plan.find_or_create_by( :name => "$500", :price => 500)
Plan.find_or_create_by( :name  => "$1000",:price => 1000)
Admin.find_or_create_by( :email => "admin@gmail.com", :password => "admin123!",:password_confirmation => "admin123!" )