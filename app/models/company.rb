class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees


  # accepts_nested_attributes_for :offices

  def offices_attributes=(office_attributes)
    office_attributes.values.each do |office_attribute|
      office = Office.find_or_create_by(office_attribute)
      self.offices << office
    end
  end
  
  
end
