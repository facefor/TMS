class Animal
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.get_count
    puts "Количество созданных объектов Animal: #{@@count}"
  end
end

class Dog < Animal
  def initialize
    super
  end
end

class Cat < Animal
  def initialize
    super
  end
end

class Horse < Animal
  def initialize
    super
  end
end




dog1 = Dog.new
cat1 = Cat.new
horse1 = Horse.new

Animal.get_count
