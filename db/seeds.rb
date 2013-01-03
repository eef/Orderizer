# Reset the database
User.destroy_all
Menu.destroy_all # Items attached to this menu will automatically be destroy because :dependent => :destroy exists on the association in menu.rb line 3
Order.destroy_all

# Create the users
admin_1 = User.create! :email => "william.mcgregor@gmail.com", :password => "bawheed123", :password_confirmation => "bawheed123", :first_name => "Will", :last_name => "McGregor"
admin_2 = User.create! :email => "uberhaqer@gmail.com", :password => "yermaw123", :password_confirmation => "yermaw123", :first_name => "Arthur", :last_name => "Canal"
# Give the users a role
admin_1.add_role! 'admin'
admin_2.add_role! 'admin'

# Now lets add some items, we will geneate some random data using the Faker gem for the description - http://faker.rubyforge.org/rdoc/
# and a random generated number for the price
# Items will be an array of hashes which match the attributes of an Item, except for the menu_id.  I will explain in further comments.
# {:description => 'Description here', :price => 1.5}
#
# items = [
#   {:description => "Sausage & Bacon Roll", :price => 1.5},
#   {:description => "Scone & Sausage", :price => 1.5},
#   {:description => "Scone & Bacon", :price => 1.5},
#   {:description => "Sausage", :price => 1.5},
#   {:description => "Bacon", :price => 1.5},
#   {:description => "Sausage & Black pudding", :price => 1.5}
# ]

items = []

20.times do
  items << {:description => "#{Faker::Lorem.words(1).first} & #{Faker::Lorem.words(1).first}", :price => (rand * (3.00)).to_s[0..3].to_f}
end

# Ok. Now we loop across the array of hashes and start to create them.
# you will see the method 'menu.items.build' which takes the hash, which matches the attributes of the item, and build the object.
# Using this method means that when you save the item the menu_id of that item will be set automatically.  This means that you
# do not have to set the menu_id manually.  You should never have to set an association id manually in Rails.  If you do you are doing it wrong.
# I have added examples below on how to create the items and now have to set the menu_id.  This would usually take place in the controller.
# This 3 ways off the top of my head to do this.  You can do it loads of different ways.


# ------------------- Start Method 1 -------------------
puts "Method 1 is running"
@menu = Menu.create! :name => "Menu One"
items.each do |item|
  item = @menu.items.build(item)
  if item.save
    puts "Saved #{item.description}"
  else
    puts "Unable to save #{item.description}"
  end
end
# ------------------- Start Method 1 -------------------

# ------------------- Start Method 2 -------------------
puts "Method 2 is running"
@menu = Menu.create! :name => "Menu Two"
items.each do |item|
  item = Item.new(item)
  # menu.items extends Array essentially menu.items is an array
  @menu.items << item
  # << is an array method, it adds an item to the end of an array - http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-3C-3C
  # the what it is doing really is something like this:
  # items.push(item) http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-push
  #
  # Or if someone ever asked you to implement push or << yourself then the following is acceptable
  # items = []
  # items[items.length] = item

end
# Now we save the menu object and all the items will have menu_id set
if @menu.save
  puts "Saved menu: #{@menu.name}"
else
  puts "Unable to save menu: #{@menu.name}"
end
# ------------------- End Method 2 -------------------

# ------------------- Start Method 3 -------------------
# Method 3
puts "Method 3 is running"
@menu = Menu.create! :name => "Menu Three"
items.each do |item|
  item = Item.new(item)
  item.menu = @menu
  if item.save
    puts "Saved #{item.description}"
  else
    puts "Unable to save #{item.description}"
  end
end
# ------------------- Start Method 3 -------------------
