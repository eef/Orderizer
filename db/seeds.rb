# Reset the database
User.destroy_all
Menu.destroy_all # Items attached to this menu will automatically be destroy because :dependent => :destroy exists on the association in menu.rb line 3
Order.destroy_all
#
# Create the users
admin_1 = User.create! :email => "william.mcgregor@gmail.com", :password => "bawheed123", :password_confirmation => "bawheed123", :first_name => "Will", :last_name => "McGregor"
admin_2 = User.create! :email => "uberhaqer@gmail.com", :password => "yermaw123", :password_confirmation => "yermaw123", :first_name => "Arthur", :last_name => "Canal"
# Give the users a role
admin_1.add_role! 'admin'
admin_2.add_role! 'admin'


 items = [
   {:description => "Sausage & Bacon Roll", :price => 150},
   {:description => "Scone & Sausage", :price => 150},
   {:description => "Scone & Bacon", :price => 150},
   {:description => "Sausage", :price => 150},
   {:description => "Bacon", :price => 150},
   {:description => "Sausage & Black pudding", :price => 150}
  ]

puts "Creating Menu One"
@menu = Menu.create! :name => "Menu One"
items.each do |item|
  item = @menu.items.build(item)
  if item.save
    puts "Saved #{item.description}"
  else
    puts "Unable to save #{item.description}"
  end
end
