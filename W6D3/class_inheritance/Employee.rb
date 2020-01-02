class Employee
    attr_reader :name, :title, :salary
    attr_accessor :boss

    def initialize(name, title, boss=nil, salary) 
        @name = name
        @title = title
        @salary = salary
        @boss = add_boss(boss)
    end

    def bonus(multiplier)
        salary * multiplier
    end

    def add_boss(boss)
        self.boss = boss
        boss.add_employee(self) if !boss.nil?
    end

end

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, boss, salary)
        super(name,title,boss,salary)
        @employees = []
    end

    def add_employee(new_employee)
        employees << new_employee
    end

   
    def bonus(multiplier)

        total_salary = salary

        employees.each do |employee|
            if employee.is_a?(Manager) 
                total_salary += employee.bonus(multiplier)
            else
                total_salary += employee.salary
            end
        end
        
        total_salary * multiplier

    end


end


