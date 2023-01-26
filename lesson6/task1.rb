#Создать класс Soda (для определения типа газировки), принимающий 1 аргумент при инициализации (отвечающий за добавку к выбираемому лимонаду).
# В этом классе реализуйте метод show my drink(), выводящий на печать «Газировка и {ДОБАВКА}» в случае наличия добавки,
# а иначе отобразится следующая фраза: «Обычная газировка».attr_accessor :ingridient

class Soda
  attr_accessor :ingridient
  def initialize(ingridient = '')
   @ingridient = ingridient
  end
  
  def show_my_drink
   if ingridient == ''
    puts 'Обычная газировка'
   else
    puts "Газировка c #{ingridient}"
   end
  end
end


component = Soda.new
component.show_my_drink