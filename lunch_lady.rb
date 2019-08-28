


@main_dish = [
  {
    id: 1,
    name: "New York Steak",
    price: 18.00
},
{
  id: 2,
  name: "Lasagna",
  price: 10.50
},
{
  id:3,
  name: "Fried Chicken",
  price: 9.00
},
{
  id:4,
  name: "Cheese Burger",
  price: 6.00
},
{
  id:5,
  name: "Hotdog",
  price: 4.50
},
{
  id:6,
  name: "Meatloaf",
  price: 10.50
}
]

@side_dish = [
  {
    id: 1,
    name: "Ceasar Salad",
    price: 4.00
},
{
  id: 2,
  name: "French Fries",
  price: 2.99
},
{
  id:3,
  name: "Biscuits",
  price: 3.00
},
{
  id:4,
  name: "Garlic Bread",
  price: 2.00
},
{
  id:5,
  name: "Mashed Potatoes",
  price: 4.00
},
{
  id:6,
  name: "Steamed Veggies",
  price: 4
},
{
  id:7,
  name: "Regular drink",
  price: 1.00
}
]
@main = ''
@main_price = 0



class Meal
  attr_accessor :main, :main_price, :side1, :side1_price, :side2, :side2_price, :account_balance
  
  def initialize(main, main_price, side1, side1_price, side2, side2_price, account_balance)
    @main = main
    @main_price = main_price
    @side1 = side1
    @side1_price = side1_price
    @side2 = side2
    @side2_price = side2_price
    @account_balance = account_balance

  end

  def display_meal
    puts "Your order today is : #{@main}, #{@side1}, #{@side2}"

  end

  def total
    @total = @main_price + @side1_price + @side2_price
    puts "Your total today is: $#{(@total).round(2)}"
    checkout
  end

  def checkout
    puts "Would you like to check out? (y/n)"
    choice = gets.chomp
    case choice
    when 'y'
      puts "Enjoy your meal!"
      @account_balance -= @total
      puts "Your remaining balance is: $#{(@account_balance).round(2)}"
      exit
    when 'n'
      menu
    else
      puts "please enter a valid option"
      checkout
    end
  end



end

@account_balance = rand(5...50)

def space
  puts " "
end

def menu
  puts "Welcome to Lunch Lady!"
  puts "Your account balance is $#{@account_balance}"
  space
  puts "Our meals consist of one main dish and two sides"
  space
  main_dish
end

  def main_dish
    puts "Please choose one main dish from the menu:"
    space
    @main_dish.each do |main|
      puts "#{main[:id]}) #{main[:name]} Price: $#{main[:price]}"
    end
    space
    grab_main = gets.chomp.to_i
    
    @main_dish.each do |main|
      if grab_main == main[:id]
        @main = main[:name]
        @main_price = main[:price]
      else
        next
      end
    end

    if @main == '' && @main_price == 0
      puts "Please enter a valid option"
      main_dish
    end
  
   side_dish1

  end

  def side_dish1
    puts "Sides"
    space
    puts "You current balance is $#{@account_balance}"
    space
    @side_dish.each do |side|
      puts "#{side[:id]}) #{side[:name]} Price: $#{side[:price]}"
    end
    space
    puts "Please enter the ID for the side you would like to add"
    grab_side = gets.chomp.to_i
    @side_dish.each do |side|
    if grab_side == side[:id]
          @side1 = side[:name]
          @side1_price = side[:price]
    else 
      next
    end
  end
  if @main == '' && @main_price == 0
    puts "Please enter a valid option"
    main_dish
  end
     side_dish2
  
    end 

    def side_dish2
      puts "Sides"
      space
      puts "You current balance is $#{@account_balance}"
      space
      @side_dish.each do |side|
        puts "#{side[:id]}) #{side[:name]} Price: $#{side[:price]}"
      end
      space
      puts "Please enter the ID for the second side you would like to add"
      grab_side = gets.chomp.to_i
      @side_dish.each do |side|
      if grab_side == side[:id]
            @side2 = side[:name]
            @side2_price = side[:price]
            break
      else 
        next
      end
    end
    if @main == '' && @main_price == 0
      puts "Please enter a valid option"
      main_dish
    end
       view_order
    
      end 

  def view_order
    @meal1 = Meal.new(@main, @main_price, @side1, @side1_price, @side2, @side2_price, @account_balance)

    @meal1.display_meal
    @meal1.total
    @meal1.checkout
    
  end

  

  menu
