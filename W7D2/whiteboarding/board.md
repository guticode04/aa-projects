#Partner B: Jennie Q1

What is a class?
A class is an object that you can instantiate other objects from.  It holds methods that its instances can call upon.

-----------
#Partner A: Gustavo Q1

What is an object?
In simplest term an object is a piece of data or data. Objects are used to model
or hold certain data.

Answer: is an instace of a class. 
------------
#Partner B: Jennie Q2

What does "self" mean?
If you are calling self withing a class, self means the class.  And if you are calling it from a method of an instance, then self is the instance.

class WhatIsSelf
  def test
    puts "At the instance level, self is #{self}"
  end

  def self.test
    puts "At the class level, self is #{self}"
  end
end
--------------
Partner A: Gustavo Q2
**Explain this ruby idiom: `a ||= b`**

It has to do with truthy and falsy values in ruby. What it is saying is that if 'a' is a falsy value we will assing 'b' to 'a'. If 'a' is a truthy
value then 'a' will be assigned to 'a'. 

---------------
Partner B: Jennie Q3
What is the use of `super`?

We use "super" to call a method in the parent class that has the same name.

ANSWER:
It calls a method on the parent class with the same name as the method that
calls `super`.
________________

Partner A: Gustavo Q3

**What is unit testing? What is the primary technique when writing a test?**
Unit testing is the most basic testing because it tests only one specific 'unit' the program. The primary technique when writing a test is RED,GREEN,REFACTOR. In red you make sure your test fails. Green you write minimal code to pass test. Refactor, you optimize your code. 

**Answer:** Unit testing, simply put, is testing methods -- the smallest unit in
object-oriented programming. The primary way to achieve this is to assert that
the **actual** result of the method matches an **expected** result.

_______________
Partner B: Jennie Q4

Designing a jukebox
- virtual
- no money involved

class Jukebox
    def initialize(player, person)
        @player = player
        @person = person
        @current_song = nil
    end
end

class Player
    def initialize(albums, songs)
        @albums = albums
        @songs = songs
    end

    def play
        play_song
    end
end

class Songs
    attr_accessor :playlist
    def initialize
        @playlist = []
    end

    def add_song(song)
        self.playlist << song
    end

    def play_song
        self.playlist.shift
    end
end

ANSWER:

class Jukebox
  attr_accessor :user
  attr_reader :current_track

  def initialize(player, user)
    @player = player
    @user = user
    @current_track = nil
  end

end

class Player
  attr_accessor :album, :playlist

  def initialize(album, playlist)
    @album = album
    @playlist = playlist
  end

  def play_track(track)
    # Begin playing...
  end
end

class Playlist
  def initialize
    @queue = []
  end

  def add_track(track)
    @queue.push(track)
  end

  def shift
    @queue.shift
  end
end

class Album
  # Information about the album
end

class Track
  # Information about the track, including album
end

class User
  # Information about the user.
end

Partner A: Gustavo Q4

Design a parking lot. Don't design method just what each class should have.

- Can have many floors
- Motorcycle, Cars, Busses- Each has diff size
- Multiple parking spot sizes
- compact and regular
- Motorcycle take any spot regular/ compact. require 4ft of space
- Cars take any regular spot. require 8ft
- Buses need 40ft of parking. 5 regular spots

class ParkingLot
  def initialize
    @levels = 
  end

  def park_vehicle
    #true or false if parking successful
  end
end

class Level
  def initialize
    @number_of_spots = 
    @level = floor_num
    @available_spots = 

  end
end

class ParkingSpot < ParkingLot

end

class Vehicle
  attr_reader :license_plate

  def initialize(license_plate)
    @license_plate = license_plate
  end
end

class Mortorcycle < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end
end

class Car < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end
end

class Busses < Vehicle
  def initialize
    super
    @spots_needed = 5
    @size = :big
  end
end

ANSWER:
```ruby
class Vehicle
  attr_reader :spots_needed, :size

  def initialize(license_plate)
    @parking_spots = []
    @license_plate = license_plate
  end

  def park_in_spot(spot)
    # ...
  end

  def clear_spots
    # ...
  end

  def can_fit_in_spot(spot)
    # ...
  end
end

class Bus < Vehicle
  def initialize
    super
    @spots_needed = 5
    @size = :large
  end

  def can_fit_in_spot(spot)
    # Checks if spot is :large
  end
end

class Car < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end

  def can_fit_in_spot(spot)
    # Check if spot is :compact or :large
  end
end

class Motorcycle < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end
end

class ParkingLot
  def initialize
    @levels = # generate_levels
  end

  def park_vehicle(vehicle)
    # Park the vehicle in a spot or multiple spots. Return false if failed.
  end
end

class Level
  def initialize(floor, num_spots)
    @spots = # generate spots
    @available_spots = num_spots
    @floor = floor
  end

  def park_vehicle(vehicle)
    # Find a place to park vehicle or return false.
  end

  def park_starting_at(spot_num, vehicle)
    # Park a vehicle starting at spot number and continue until vehicle.spots_needed.
  end

  def find_available_spots(vehicle)
    # Find a spot to park the vehicle. Return index of spot or -1.
  end

  def spot_freed
    @available_spots += 1
  end
end

class ParkingSpot
  attr_reader :row, :spot_num

  def initialize(size, level, row, spot_num)
    @vehicle = nil
    @spot_size = size
    @level = level
    @row = row
    @spot_num = spot_num
  end

  def is_free?
    !@vehicle
  end

  def can_fit_vehicle?(vehicle)
    # Check it will fit.
  end

  def park(vehicle)
    # Park in spot
  end

  def unpark
    # Remove vehicle from spot and notify level that a new spot is available.
  end
end
```

-----------------------------
Partner B: Jennie Q5

## Implement BFS

For this problem assume there is a Node class. The node class will take in a
value as part of its initialization.

Write a new method `bfs` on the `Node` class that does a breadth-first search
starting at a root node. It takes in a proc as an argument. Assume nodes have a
value, and a `attr_reader` on that value. Assume there are working
`parent`/`child`-related methods for Node.

Example usage:

```ruby
n1 = Node.new(1) #making a node with a value of 1

n1.bfs {|node| node.value == 1} #=> n1 (found a node with value == 1)
```

def bfs(target, &prc)
    raise "must have target or prc" if [target, prc].nil?
    prc ||= Proc.new {|node| node.value == target}

    queue = [self]

    until queue.empty?
        node = queue.shift
        return node if prc.call(node.value)
        queue.concat(node.children)
    end
    nil
end

end

ANSWER:
class Node
  # -- Assume nodes have a value, and a attr_reader on value
  # -- Also, assume there are working parent/child-related methods for Node

  def bfs(&prc)
    raise "Must give a proc" if prc.nil?

    queue = [self]

    until queue.empty?
      visited = queue.shift
      return visited if prc.call(visited.val)
      queue += visited.children
    end

    nil
  end
end

------------------
Partner A: Gustavo Q5

## Implement DFS

For this problem assume there is a Node class. The node class will take in a
value as part of its initialization.

Write a method `dfs` that does a depth-first search starting at a root node. It
takes in a proc as an argument. Assume nodes have a value, and a `attr_reader`
on that value. Assume there are working `parent`/`child`-related methods for
Node.

Example usage:

```ruby
n1 = Node.new(1) #making a node with a value of 1

n1.dfs { |node| node.value == 1 } #=> n1 (found a node with value == 1)
```

class Node
  def dfs(&prc)
    raise "Must give proc" if prc.nil?

    #usually recursive need base case
    return self if prc.call(self)

    #recursive case
    self.children.each do |child_node|
      #going to return self if self satisfies prc
      answer = child_node.dfs(&prc)
      #return answer 
      # can be "if answer" because nil and false are the only falsey values in ruby
      # so will enter if statement
      return answer if !answer.nil?  
    end
    #if we don't find what we are looking for
    nil 
  end
end

### Solution

```rb
class Node

  # -- Assume nodes have a value, and a attr_reader on value
  # -- Also, assume there are working parent/child-related methods for Node
  def dfs(&prc)
    raise "Must give a proc" if prc.nil?

    return self if prc.call(self)

    self.children.each do |node|
      result = node.dfs(&prc)
      return result if result
    end

    nil
  end
end
```