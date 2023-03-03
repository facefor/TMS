class Employee
  attr_accessor :name, :position, :salary_rate, :worked_hours, :experience_years
  
  def initialize(name, position, salary_rate, worked_hours, experience_years)
    @name = name
    @position = position
    @salary_rate = salary_rate
    @worked_hours = worked_hours
    @experience_years = experience_years
  end
  
  def calculate_salary
    @salary_rate * @worked_hours
  end
  
  def save_to_file(file_path)
    File.open(file_path, 'a') do |file|
      file.puts "#{@name}, #{@position}, #{@salary_rate}, #{@worked_hours}, #{@experience_years}"
    end
  end
end

class EmployeeFilter
  def initialize(file_path)
    @employees = []
    
    File.open(file_path, 'r') do |file|
      file.each_line do |line|
        employee_data = line.chomp.split(', ')
        employee = Employee.new(*employee_data)
        @employees << employee
      end
    end
  end
  
  def filter_by_name(name)
    selector { |employee| employee.name.downcase.include?(name.downcase) }
  end
  
  def filter_by_position(position)
    selector { |employee| employee.position.downcase.include?(position.downcase) }
  end
  
  def filter_by_salary_rate(min_salary_rate, max_salary_rate)
    selector { |employee| employee.salary_rate.between?(min_salary_rate, max_salary_rate) }
  end
  
  def filter_by_worked_hours(min_worked_hours, max_worked_hours)
    selector { |employee| employee.worked_hours.between?(min_worked_hours, max_worked_hours) }
  end
  
  def filter_by_experience_years(min_experience_years, max_experience_years)
    selector { |employee| employee.experience_years.between?(min_experience_years, max_experience_years) }
  end
  
  private
  
  def selector(&block)
    @employees.select(&block)
  end
end

class Menu
  def initialize
    @employee_filter = EmployeeFilter.new('employees.txt')
  end
  
  def start
    loop do
      puts "Выберите действие:"
      puts "1. Вывод всех сотрудников"
      puts "2. Добавление сотрудника"
      puts "3. Отсортировать сотрудников"
      puts "4. Завершить работу"
      
      choice = gets.chomp.to_i
      
      case choice
      when 1
        show_all_employees
      when 2
        add_employee
      when 3
        sort_employees_menu
      when 4
        puts "Работа завершена."
        break
      else
        puts "Некорректный ввод. Попробуйте еще раз."
      end
    end
  end
  
  private
  
  def show_all_employees
    employees = @employee_filter.filter_by_name('')
    
    if employees.empty?
      puts "Нет сотрудников для вывода."
      return
    end
    
    employees.each do |employee|
      puts "#{employee.name}, #{employee.position}, #{employee.salary_rate}, #{employee.worked_hours}, #{employee.experience_years}"
    end
  end