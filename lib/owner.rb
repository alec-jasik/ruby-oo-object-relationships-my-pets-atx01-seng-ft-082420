require 'pry'

class Owner
  
  @@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all 
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |dog| 
     if dog.owner == self
      dog.mood = "happy"
      dog.class.all.clear
      end
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      if cat.owner == self
        cat.mood = "happy"
        cat.class.all.clear
      end
    end
  end

  def sell_pets
    Cat.all.select do |cat|
      if cat.owner == self 
        cat.mood = "nervous"
        cat.owner = nil
      end
    end

    Dog.all.select do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end
  end

  def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end