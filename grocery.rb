# Display a menu in the console for the user to interact with.
# Create a default array of hashes that represent items at a grocery store.
# Create a menu option to add items to a user's grocery cart.
# Create a menu option to display all the items in the cart.
# Create a menu option to remove an item from the users cart.
# Create a menu option to show the total cost of all the items in the user's cart.
# Add new items to the grocery store.
# Zip it up and turn it in!

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

# items in cart // data container
@in_cart_items = [
 {}
]


@cond_cart_view = 0
# puts @food_items that are in the cart
def cart_items
  if @cond_cart_view == 0
    puts "There is nothing in your cart."
    menu
  else
  @in_cart_items.each_with_index do |cart, index|
    puts "Items in cart:" # #{index + 1}"
    # cart.each do |item, value|
    puts "Item ##{index + 1}: #{cart[:name]}  Price: #{cart[:price] }"
  
  puts "------------------"
  end
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
  food_choice = food_choice - 1
  in_cart = food_choice
  if food_choice == in_cart
    in_cart = food_list[in_cart.to_i]
    @in_cart_items.unshift(in_cart)
    @cond_cart_view += 1
  else
  end
  puts 'Select another item? y/n -->' 
  choice = gets.strip.downcase
  if choice == 'y'
    select_item
    else 
  menu
    end
end


# adding a recommended item to the grocery store
# need to figure out how to make it display correctly
def add_item
  puts "What food item would you like to add to the grocery store?"
  new_item_rec = gets.chomp!
  if new_item_rec.empty?
    puts "You must provide a name for the item"
    add_item
  else
  end
  puts "How many of that item would you like to add?"
  new_item_inv = gets.chomp!
  if new_item_inv.empty?
    puts "You must provide an inventory amount for the item"
    puts "How many of that item would you like to add?"
    new_item_inv = gets.chomp!
  else
  end
  puts "How much would it cost?"
  new_item_cost = gets.chomp!
  if new_item_cost.empty?
    puts "You must provide a cost for the item"
    puts "How much would it cost?"
  new_item_cost = gets.chomp!
  else
  end
  new_item = {name: new_item_rec, inventory: new_item_inv.to_i, price: new_item_cost.to_f}
  @food_items.push(new_item)
  food_list
  puts 'Add another item? y/n -->' 
  choice = gets.strip.downcase
  if choice == 'y'
    add_item
    else 
  menu
    end
end

#removing an item from cart, does follow along with the listed number
def remove_item(index)
  @in_cart_items.delete_at(index)
  @cond_cart_view -= 1
  puts "Item has been removed"
  cart_items
  puts 'Remove another item? y/n -->' 
  choice = gets.strip.downcase
  if choice == 'y'
    if @cond_cart_view >= 1
      puts "What item would you like to remove from your cart?"
      @in_cart_items
      index = gets.to_i
      remove_item(index - 1)
      else 
        puts 'There is nothing in your cart to remove.'
      menu
    end
    else 
  menu
    end
end


def checkout
  @in_cart_items
  sum = 0
  @in_cart_items.each do |key, value|
    # p "#{key[:price]}"
    sum += key[:price].to_f
  end
  puts "Your total is $#{sum}"
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
    menu
  elsif menu_choice == 2
    # puts 'Here are your available items'
    
    # food_list
    if @cond_cart_view == 0
      @in_cart_items.delete_at(0)
    end
    select_item
    menu
  elsif menu_choice == 3
    cart_items
    menu
  elsif menu_choice == 4
    if @cond_cart_view >= 1
    puts "What item would you like to remove from your cart?"
    @in_cart_items
    index = gets.to_i
    remove_item(index - 1)
    else 
      puts 'There is nothing in your cart to remove.'
    menu
  end
  elsif menu_choice == 5
    checkout
    menu
  elsif menu_choice == 6
    add_item
    menu
  elsif menu_choice == 7
    puts 'Come back again!'
    exit
  else
  end
end


menu