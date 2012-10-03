# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_1 = User.create! :email => "william.mcgregor@gmail.com", :password => "bawheed123", :password_confirmation => "bawheed123", :first_name => "Will", :last_name => "McGregor"
admin_2 = User.create! :email => "uberhaqer@gmail.com", :password => "yermaw123", :password_confirmation => "yermaw123", :first_name => "Arthur", :last_name => "Canal"

admin_1.add_role! 'admin'
admin_2.add_role! 'admin'
