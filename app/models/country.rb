class Country < ApplicationRecord
  self.table_name = "countries"
  validates :name, presence: true
  validates :code_iso, presence: true
  has_many :cities
  has_many :events
end
