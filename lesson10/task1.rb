begin
  print "Введите число: "
  number = Integer(gets)
  puts "Вы ввели число #{number}"
rescue ArgumentError
  puts "Вы ввели не число!"
end