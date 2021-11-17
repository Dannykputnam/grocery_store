# Display a menu in the console for the user to interact with.
# Create a default array of hashes that represent items at a grocery store.
# Create a menu option to add items to a user's grocery cart.
# Create a menu option to display all the items in the cart.
# Create a menu option to remove an item from the users cart.
# Create a menu option to show the total cost of all the items in the user's cart.
# Add new items to the grocery store.
# Zip it up and turn it in!
@food_items = [
  {name: 'Apples', inventory: 1, price: 1.00},
  {name: 'Banana', inventory: 2, price: 2.00},
  {name: 'Orange', inventory: 3, price: 3.00},
  {name: 'Milk', inventory: 4, price: 4.00},
  {name: 'Bread', inventory: 4, price: 4.00}
]

# puts @food_items
def food_list
@food_items.each_with_index do |food, index|
  puts "Food Item #{index + 1}"
  food.each do |name, value|
    puts "#{name}: #{value}"
  end
puts "------------------"
end
end

# food_list
# set a variable that is the users input that is an int. food_choice
#the in_cart variable is then set equal to food choice
# if the food_choice is equal to in_cart then we will add that food_item by the int to the in_cart
# This way we don't have to add an if/else to select an item for every new item that is added to @food_items
def select_item
  puts 'Here are your available items'
  food_list
  print 'Select your item by number  --->  '
  food_choice = gets.strip.to_i
  key = h.keys
in_cart = food_choice
  if food_choice == in_cart
  n = @food_items[food_choice[keys[1]]
    @in_cart_items.unshift(n)
  else
  end
  menu
end

# items in cart // data container
@in_cart_items = [

]

# puts @food_items that are in the cart
def cart_items
@in_cart_items.each_with_index do |cart, index|
    puts "Currently in your cart"
cart.each do |name, value|
      puts "#{name}: #{value}"
    end
  puts "------------------"
  puts 'Return to menu? y/n'
  menu_choice = gets.strip
  if menu_choice == 'y'
    menu
  else
  end
  end
end


def menu
  puts '1. Food thats available'
  puts '2. Select item'
  puts '3. Display items in cart'
  puts '4. Remove item'
  puts '5. Checkout'
  puts '6. Add new items'
  puts '7. Exit'
  menu_choice = gets.strip.to_i
  if menu_choice == 1
    food_list
  elsif menu_choice == 2
    select_item
  elsif menu_choice == 3
    cart_items
  elsif menu_choice == 4
    remove_item
  elsif menu_choice == 5
    checkout
  elsif menu_choice == 6
    add_item
  elsif menu_choice == 7
    puts 'see you later'
    exit
  else
  end
end


menu