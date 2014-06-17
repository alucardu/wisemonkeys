# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{
	name: 'Bram Mous', email: 'bram_mous@gmail.com', password: '1234567890', password_confirmation: '1234567890', b_account: 'true', administrator: 'true', activated: 'true'
	}])
