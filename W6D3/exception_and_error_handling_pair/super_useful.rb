# PHASE 2
def convert_to_int(str)
  begin
    n = Integer(str)
  rescue ArgumentError
    puts "Give valid numeric string"
    n = nil
  end
  n 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)

  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise FruitNotInListError
  end 
  
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin 
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => e 
    puts e.message
    retry
  rescue FruitNotInListError => e
    puts e.message
  end
end  

class CoffeeError < StandardError
  def message
    "Okay that woke me up! Thanks. Feed me more!"
  end
end

class FruitNotInListError < StandardError
  def message
    "I dont like that fruit"
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new "Please give a valid name!" if name.empty?
    raise ArgumentError.new " Not my bestfriend yet!!!" if yrs_known <= 5
    raise ArgumentError.new "Favorite pass time !" if fav_pastime.empty?

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


