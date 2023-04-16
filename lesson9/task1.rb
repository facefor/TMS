class Product
  attr_accessor :name, :price, :rating

  def initialize(name, price, rating)
    @name = name
    @price = price
    @rating = rating
  end
end

class Category
  attr_accessor :name, :products

  def initialize(name)
    @name = name
    @products = []
  end
end

class Basket
  attr_accessor :items

  def initialize
    @items = []
  end
end

class User
  attr_accessor :login, :password, :basket

  def initialize(login, password)
    @login = login
    @password = password
    @basket = Basket.new
  end
end

class Store
  attr_accessor :categories, :users

  def initialize
    @categories = []
    @users = []
  end

  def add_category(category)
    @categories << category
  end

  def add_user(user)
    @users << user
  end

  def print_catalog
    @categories.each do |category|
      puts "Category: #{category.name}"
      puts "---------------------"
      category.products.each do |product|
        puts "Name: #{product.name}, Price: #{product.price}, Rating: #{product.rating}"
      end
      puts ""
    end
  end

  def print_purchases
    @users.each do |user|
      puts "User: #{user.login}"
      puts "---------------------"
      user.basket.items.each do |item|
        puts "Name: #{item.name}, Price: #{item.price}"
      end
      puts ""
    end
  end
end

# создаем товары
product1 = Product.new("Product 1", 10, 4.5)
product2 = Product.new("Product 2", 20, 4.0)
product3 = Product.new("Product 3", 30, 3.5)

# создаем категории и добавляем товары
category1 = Category.new("Category 1")
category1.products << product1 << product2

category2 = Category.new("Category 2")
category2.products << product3

# создаем магазин и добавляем категории
store = Store.new
store.add_category(category1)
store.add_category(category2)

# создаем пользователей и добавляем их в магазин
user1 = User.new("user1", "password1")
user2 = User.new("user2", "password2")
store.add_user(user1)
store.add_user(user2)

# пользователи покупают товары
user1.basket.items << product1 << product3
user2.basket.items << product2 << product3

# выводим каталог продуктов и покупки пользователей
store.print_catalog
store.print_purchases