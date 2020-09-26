# EXTRA HOMEWORK
# Farmer's Market
# item: price
# given infinite stock :)
items = {
    carrots: 100,
    onions: 50,
    tomatoes: 70,
    potatoes: 80
  }
  # cart = {}
  cart = Hash.new()
  totalPrice = 0
  item = 0
  
  # display items: price
  puts "Today we have:"
  items.each do |key, value|
    puts "#{key.capitalize} at #{value} yen per piece."
  end
  
  while item != 'none' do
      puts "What would you like to buy today?" 
      item = gets.chomp    
      if items.find {|i, p| item == i.to_s}
          puts "How many would you like to buy?"
          quantity = gets.chomp.to_i
      
          # add the item and the quantity into cart
          cart[item] = quantity
  
          # get the price of the item
          price = items.select{|i, p| item == i.to_s} .to_a[0][1]
  
          #calculate total price
          totalPrice = totalPrice + (quantity.to_i * price)
      
          # display the item(s) and total price
          puts "Your cart contains:"
          cart.each do |key, value|
            puts "#{value} piece(s) of #{key}."
          end
          puts "Total price is: #{totalPrice}"
        else 
        puts "Input error."
        end
  end