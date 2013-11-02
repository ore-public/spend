# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Admin User
User.delete_all
u = User.new(email: "admin@super_user.com", password: "hogehoge")
u.save!

u = User.new(email: "user@user.com", password: "fugafuga")
u.save!
