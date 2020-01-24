class Cat < ApplicationRecord
    COLORS =['black', 'white', 'orange', 'brown'] 
    validates :birth_date, :color, :name, :sex, :description, presence: true 
    validates :sex inclusion: { in: %w(M F), 
    message: '%{value} is not valid' }  
    validates :color inclusion: { in: COLORS } 

    def age 
        ((Time.zone.now - self.birth_date.to_time) / 1.year.sec).floor
    end 
end
