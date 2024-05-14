class Weight < ApplicationRecord
  belongs_to :user
  validates :value, presence: true, numericality: { greater_than: 0 }

  def self.kg_to_lbs(kilograms)
    kilograms * 2.20462
  end

  def self.lbs_to_kg(pounds)
    pounds / 2.20462
  end

  def preferred_value(unit)
    if self.unit == 'kg' && unit == 'lbs'
      puts "Converting to lbs"
      Weight.kg_to_lbs(value)
    elsif self.unit == 'lbs' && unit == 'kg'
      puts "Converting ot kg"
      Weight.lbs_to_kg(value)
    else
      value
    end
  end
end
