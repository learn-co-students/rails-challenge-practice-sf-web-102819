class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices
  has_many :employees, through: :companies

  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def total_rent 
    num_of_occupied_floors = self.number_of_floors - self.number_of_floors_available.length
    num_of_occupied_floors * self.rent_per_floor
  end


  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

end
