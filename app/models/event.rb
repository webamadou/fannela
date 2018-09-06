class Event < ApplicationRecord

  self.table_name = 'events'
  belongs_to :country, :class_name => 'Country', foreign_key: 'country_id'
  belongs_to :category, :class_name => 'Category', foreign_key: 'categories_id'

  validates :title, presence: true, length: {minimum: 3}
end