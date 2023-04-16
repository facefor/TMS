module Vehicles
  class Car
    attr_accessor :brand, :car_class, :weight, :driver, :engine
    
    def initialize(brand, car_class, weight, driver, engine)
      @brand = brand
      @car_class = car_class
      @weight = weight
      @driver = driver
      @engine = engine
    end
    
    def start
      puts "Поехали"
    end
    
    def stop
      puts "Останавливаемся"
    end
    
    def turn_right
      puts "Поворот направо"
    end
    
    def turn_left
      puts "Поворот налево"
    end
    
    def to_s
      "Марка: #{@brand}, Класс: #{@car_class}, Вес: #{@weight},
      Водитель: #{@driver}, Мотор: #{@engine}"
    end
  end
  
  class Lorry < Car
    attr_accessor :cargo_capacity
    
    def initialize(brand, car_class, weight, driver, engine, cargo_capacity)
      super(brand, car_class, weight, driver, engine)
      @cargo_capacity = cargo_capacity
    end
  end
  
  class SportCar < Car
    attr_accessor :top_speed
    
    def initialize(brand, car_class, weight, driver, engine, top_speed)
      super(brand, car_class, weight, driver, engine)
      @top_speed = top_speed
    end
  end
end

module Professions
  class Engine
    attr_accessor :power, :manufacturer
    
    def initialize(power, manufacturer)
      @power = power
      @manufacturer = manufacturer
    end
  end
  
  class Driver < Person
    attr_accessor :driving_experience
    
    def initialize(full_name, driving_experience)
      super(full_name)
      @driving_experience = driving_experience
    end
  end
  
  class Person
    attr_accessor :full_name
    
    def initialize(full_name)
      @full_name = full_name
    end
  end
end