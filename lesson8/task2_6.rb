class Animal
  @@count = 0

  def initialize(food, location)
    @food = food
    @location = location
    @@count += 1
  end
  
  def self.get_count
    puts "Количество созданных объектов Animal: #{@@count}"
  end
  
  def make_noise
    puts "Животное спит"
  end
  
  def eat
    puts "Животное ест #{@food}"
  end
  
  def sleep
    puts "Животное спит"
  end
end
  
class Dog < Animal
  def initialize(name, breed, food, location)
    @name = name
    @breed = breed
    super(food, location)
  end
  
  def make_noise
    puts "#{@name} лает"
  end

  def eat
    puts "#{@name} ест #{@food}"
  end
  
  def play
    puts "#{@name} играет"
  end
end
  
class Cat < Animal
  def initialize(name, breed, food, location)
    @name = name
    @breed = breed
    super(food, location)
  end
  
  def make_noise
    puts "#{@name} мяукает"
  end
  
  def eat
    puts "#{@name} ест #{@food}"
  end
  
  def scratch
    puts "#{@name} точит когти"
  end
end
  
class Horse < Animal
  def initialize(name, breed, food, location)
    @name = name
    @breed = breed
    super(food, location)
  end
  
  def make_noise
    puts "#{@name} ржет"
  end
  
  def eat
    puts "#{@name} ест #{@food}"
  end
  
  def run
    puts "#{@name} бежит"
  end
end
  
class Vet
  def treat_animal(animal)
    puts "Еда: #{animal.instance_variable_get(:@food)}, Местоположение: #{animal.instance_variable_get(:@location)}"
  end
end
  
animals = [
Dog.new("Бобик", "Такса", "кости", "в будке"),
Cat.new("Барсик", "Британец", "рыба", "на диване"),
Horse.new("Спирит", "Американская рысь", "сено", "в конюшне")
  ]
  
Vet.new.treat_animal(animals.first) 
Vet.new.treat_animal(animals.last) 
  
animals.each do |animal|
Vet.new.treat_animal(animal)
end
  
Animal.get_count 