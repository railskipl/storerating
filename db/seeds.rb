# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: 'business')
Role.create(name: 'customer')
Role.create(name: 'admin')
Plan.create(name:'$250',price: 250)
Plan.create(name:'$500',price: 500)
Plan.create(name:'$1000',price: 1000)
Admin.create(email: "admin@gmail.com",password: "admin123!",password_confirmation: "admin123!")